package main

import (
	"errors"
	"fmt"
	"log"
	"os"
	"os/exec"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Printf("Usage:\n    dcmd <vim|zsh|git|proxy|terraform|packer> <args...>\n")
		os.Exit(1)
	}
	runContainer(os.Args[1:])
}

func runContainer(args []string) {
	command, err := checkCommand(args[0])
	if err != nil {
		panic(err)
	}

	volumeBind := fmt.Sprintf("%s:/srv/app", command.Volume)
	cmdArgs := []string{"run", "-v", volumeBind, command.Name}

	if command.Proxy {
		cmdArgs = []string{"run", "-d", "-p", command.Ports, command.Name}
	} else if command.Interactive {
		cmdArgs = []string{"run", "-it", "-v", volumeBind, command.Name}
	} else if command.Name == "davyj0nes/aws" {
		homeDir := os.Getenv("HOME")
		awsCredsDir := fmt.Sprintf("%s/.aws:/root/.aws", homeDir)
		cmdArgs = []string{"run", "-it", "-v", awsCredsDir, "-v", volumeBind, command.Name}
	}

	cmdArgsFinal := append(cmdArgs, args[1:]...)

	cmd := exec.Command("docker", cmdArgsFinal...)
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	err = cmd.Run()
	if err != nil {
		log.Fatal(err)
	}
}

type command struct {
	Name        string
	Interactive bool
	Volume      string
	Ports       string
	Proxy       bool
}

func checkCommand(cmd string) (command, error) {
	curdir, err := os.Getwd()
	if err != nil {
		panic(err)
	}

	switch cmd {
	case "git":
		return command{"davyj0nes/git", false, curdir, "", false}, nil
	case "vim":
		return command{"davyj0nes/vim", true, curdir, "", false}, nil
	case "terraform":
		return command{"hashicorp/terraform:light", true, curdir, "", false}, nil
	case "packer":
		return command{"hashicorp/packer:light", true, curdir, "", false}, nil
	case "proxy":
		return command{"datadog/squid", false, curdir, "3128:3128", true}, nil
	case "zsh":
		return command{"davyj0nes/zsh", true, curdir, "", false}, nil
	case "aws":
		return command{"davyj0nes/aws", false, curdir, "", false}, nil
	default:
		return command{}, errors.New("Unknown Command")
	}
}