# Prerequisites

The project has the following prerequisites:

1. [Java 17](https://learn.microsoft.com//java/openjdk/download)
1. [Maven 3.9.9](https://maven.apache.org/download.cgi)
1. [Azure CLI 2.64.0](https://learn.microsoft.com/cli/azure/install-azure-cli-macos)
1. [Azure Dev CLI 1.10.1](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
1. [Terraform 1.9.8](https://developer.hashicorp.com/terraform/downloads)
1. [JQ 1.6](https://jqlang.github.io/jq/download/)
1. [Docker](https://docs.docker.com/get-docker/)

 If you want to use a VSCode DevContainer see the `VSCode DevContainer prerequisites` section below.

## Platform compatibility

|             |  Native   | DevContainer |
|-------------|-----------|--------------|
| Windows     |    ❌     |      ❌      |
| Windows WSL |    ✅     |      ✅      |
| macOS       |    ✅     |      ✅      |
| macOS arm64 |    ✅     |      ✅      |

## Azure CLI Extensions

### Azure Service Connector Passwordless extension

Install the [service connector extension](https://learn.microsoft.com/azure/service-connector/tutorial-passwordless?tabs=user%2Cdotnet%2Csql-me-id-dotnet%2Cappservice&pivots=postgresql#install-the-service-connector-passwordless-extension).

```shell
az extension add --name serviceconnector-passwordless --upgrade
```

## Recommended VSCode extensions

If you are using VSCode, please install the following extensions:

1. ms-azuretools.azure-dev
1. vscjava.vscode-java-pack
1. Pivotal.vscode-spring-boot
1. redhat.vscode-yaml
1. ms-azuretools.vscode-docker

## VSCode DevContainer prerequisites

1. Docker Desktop
1. VSCode
1. VSCode ms-vscode-remote.remote-containers extension
1. git
