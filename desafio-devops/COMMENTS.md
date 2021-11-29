PARA INICIO DO PROJETO VAMOS INICIAR CRIANDO A APLIVAÇÃO EM MICRO SERVIÇOS.

FOI CRIADO O ARQUIVO Dockerfile para criação da imagem.
app\Dockerfile

Iremos utializar a plataforma da AWS para subir o ambiente e o kubernetes com terraform para subir o ambiente

Na pasta Infra tem exite todos componentes para subir a plataforma e o ambiente na aws.
Após a criação do ambiente é necessário instalar o cli da aws na sua maquina

Para instalação vamos estar utilizando o chocolatey.

abra o cmd em como administrador e rode o seguinte comando:

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

Após realizar a instalação do choco digite o seguinte comando:

choco install awscli kubernetes-cli kubernetes-helm argocd-cli -y

Neste momento estamos instalando o cli para acesso a aws, kubernetes para utialização do helm e cli do argo.

Após instalação, seguir os seguintes passos (quando realizamos a criação de um usuario na aws recebemos um access key e senha).

aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json

Configura o kubeconfig para acesso ao seu cluster:

aws eks --region us-west-2 update-kubeconfig --name cluster_name

kubectl config use-context cluster_name

Para este projeto estaremos utilizando o ArgoCD para utilização de Git

Vamos esta criando o serviço para versionamento de GIT com ArgoCD dentro do kubernetes:

Basta ir na pasta Infrastruture\ArgoCD abrir o cmd da sua maquina e rodar o apply.bat

Neste momento estaremos criando um namespace e o serviço ArgoCD sem nenhuma configuração apenas como loadbalancer para acesso externo e configuração para controle via GIT.

Para serviço de monitoramento estaremos usando APM com Elastic.

Foi acrescentado no codigo api.py para estamos monitoramento todas as requisições pro serviço.

Tambem dentro da pasta grafana criamos um ambiente de monitoramento, onde dentro do grafana podemos subir as informações de da APM para monitoramento da aplicação.

Para subir todas as aplicações simplesmente apenas rodar.

Obs.: os arquivos como txt alterar para .bat
