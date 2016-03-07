#Crawler Twitter - GilcierWeb

##Simples Crawler Twitter em Ruby e Ruby On Rails com Cadastro dos tweets no banco de dados PostgreSQL

Baixe o projeto, depois abra o terminal e entre na pasta do projeto.

```shell

rails new crawler-twitter -d postgresql

cd crawler-twitter/

bundle install

rails server

#pode ser usado o app server puma
puma -p 3000

#http://localhost:3000

```
colocar usuário e senha de acesso banco de dados postgresql no arquivo config/database.yml

Criar o banco de dados postgresql

```shell
rake db:create:all
rake db:migrate
rails server
puma -p 3000

rails generate controller home index --no-assets --no-helpers

rails generate scaffold crawlerTwitter content:text user:string tags:string publish:datetime

rake -T
rake -T gem
rails generate task tweets

rake -T | grep tweets

#rake tweets:average_time                # Average time for tweets :time_init, :time_end
#rake tweets:average_time[:time_init,:time_end]                # Average time for tweetstweets :time_init, :time_end
#rake tweets:average_time['14:00:00','14:59:59']                # Average time for tweetstweets :time_init, :time_end
#rake tweets:user_most                   # User with the most tweets

```
#### Crawler do Twitter

Dentro da pasta do projeto crawler-twitter abra outro terminal e execute os comandos abaixo

```shell
cd crawler-twitter/

cd lib/crawler/

#executar o crawler-twitter
ruby twitter.rb

```
