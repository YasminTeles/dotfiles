#!/bin/bash

function step_msg {
	printf "\033[35;1m%s...\033[0m\n" "$1";
}

# AWS login and docker login
function docker-login {
    ## Private
    aws ecr get-login-password --region $AWS_REGION --profile $AWS_PROFILE \
      | docker login \
          --username AWS \
          --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

    ## Public
    aws ecr-public get-login-password --region $AWS_REGION --profile $AWS_PROFILE \
      | docker login \
          --username AWS \
          --password-stdin public.ecr.aws
}

# Pulumi login needs GITHUB_TOKEN, PULUMI_ACCESS_TOKEN
# set in the environment.
function login {
    set -a
    source $HOME/.dotfiles/.env
    set +a

    step_msg "Logging in to GitHub..."
    gh auth refresh

    step_msg "Logging in to AWS..."
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS_PROFILE is not set. Please set it before running this script."
        exit 1
    fi
    aws sso login --profile $AWS_PROFILE

    step_msg "Logging in to Docker Images.."
    docker-login

    step_msg "Logging in to Pulumi..."
    pulumi login
}
