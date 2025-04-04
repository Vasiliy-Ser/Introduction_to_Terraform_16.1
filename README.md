# Домашнее задание к занятию 16.1 «Введение в Terraform» - Падеев Василий

------

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте.  
2. Изучите файл **.gitignore**. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)  
3. Выполните код проекта. Найдите  в state-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.  
4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла **main.tf**.  
Выполните команду ```terraform validate```. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.  
5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды ```docker ps```.  
6. Замените имя docker-контейнера в блоке кода на ```hello_world```. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду ```terraform apply -auto-approve```.  
Объясните своими словами, в чём может быть опасность применения ключа  ```-auto-approve```. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды ```docker ps```.  
8. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**.   
9. Объясните, почему при этом не был удалён docker-образ **nginx:latest**. Ответ **ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ**, а затем **ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ** строчкой из документации [**terraform провайдера docker**]  (https://docs.comcloud.xyz/providers/kreuzwerker/docker/latest/docs).  (ищите в классификаторе resource docker_image )


### Решение:

1. Сохранять личную, секретную информацию (логины,пароли,ключи,токены итд) допустимо в файле personal.auto.tfvars.  
2. После выполнения кода создан ключ "result": "GLZAbVQ6bOtitoxm",

![answer1](https://github.com/Vasiliy-Ser/Introduction_to_Terraform_16.1/blob/e7039364b0d787d97d8cedb1360ce27603e8b5c3/png/1.2.png)

3. Найденные ошибки в коде:  
- Отсутствие имени для ресурса resource "docker_image"  
- Недопустимое имя ресурса для docker_container ("1nginx") т. к. начинается с цифры   
- Ссылка на несуществующий ресурс в image resource "docker_container"   
- Ссылка на несуществующий ресурс random_password.random_string_FAKE.resulT  
- Неверный регистр буквы в ссылке на ресурс random_password.random_string_FAKE.resulT  

![answer2](https://github.com/Vasiliy-Ser/Introduction_to_Terraform_16.1/blob/e7039364b0d787d97d8cedb1360ce27603e8b5c3/png/1.3.png)  
![answer3](https://github.com/Vasiliy-Ser/Introduction_to_Terraform_16.1/blob/e7039364b0d787d97d8cedb1360ce27603e8b5c3/png/1.4.png)

4. После замены имени docker-контейнера. Команда ```terraform apply -auto-approve``` автоматически подтверждает применение изменений без необходимости вручную вводить команду "yes" для подтверждения. Это полезно для автоматизации процессов и работы в скриптах, где не требуется вмешательство пользователя, но можно пропустить ошибки.  

![answer4](https://github.com/Vasiliy-Ser/Introduction_to_Terraform_16.1/blob/e7039364b0d787d97d8cedb1360ce27603e8b5c3/png/1.5.png)

5. Уничтожение созданных ресурсов

![answer5](https://github.com/Vasiliy-Ser/Introduction_to_Terraform_16.1/blob/e7039364b0d787d97d8cedb1360ce27603e8b5c3/png/1.6.png)  
![answer6](https://github.com/Vasiliy-Ser/Introduction_to_Terraform_16.1/blob/b20a3d42d8a961b66f7a56eff8fb44bcf9e2e35d/png/1.7.png)

6. Причина, по которой образ Docker nginx:latest не был удален после уничтожения созданных ресурсов с помощью Terraform, заключается в том, что сам образ не был явно включен в процесс уничтожения через конфигурацию Terraform. Terraform управляет только ресурсами, которые явно указаны в файле конфигурации, и не занимается удалением локальных Docker-образов по умолчанию.

![answer7](https://github.com/Vasiliy-Ser/Introduction_to_Terraform_16.1/blob/b20a3d42d8a961b66f7a56eff8fb44bcf9e2e35d/png/1.8.png)

------

## Дополнительное задание (со звёздочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.** Они помогут глубже разобраться в материале.   
Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 

### Задание 2*

1. Создайте в облаке ВМ. Сделайте это через web-консоль, чтобы не слить по незнанию токен от облака в github(это тема следующей лекции). Если хотите - попробуйте сделать это через terraform, прочитав документацию yandex cloud. Используйте файл ```personal.auto.tfvars``` и гитигнор или иной, безопасный способ передачи токена!
2. Подключитесь к ВМ по ssh и установите стек docker.
3. Найдите в документации docker provider способ настроить подключение terraform на вашей рабочей станции к remote docker context вашей ВМ через ssh.
4. Используя terraform и  remote docker context, скачайте и запустите на вашей ВМ контейнер ```mysql:8``` на порту ```127.0.0.1:3306```, передайте ENV-переменные. Сгенерируйте разные пароли через random_password и передайте их в контейнер, используя интерполяцию из примера с nginx.(```name  = "example_${random_password.random_string.result}"```  , двойные кавычки и фигурные скобки обязательны!) 
```
    environment:
      - "MYSQL_ROOT_PASSWORD=${...}"
      - MYSQL_DATABASE=wordpress
      - MYSQL_USER=wordpress
      - "MYSQL_PASSWORD=${...}"
      - MYSQL_ROOT_HOST="%"
```

6. Зайдите на вашу ВМ , подключитесь к контейнеру и проверьте наличие секретных env-переменных с помощью команды ```env```. Запишите ваш финальный код в репозиторий.

### Решение:

1. Для создания ВМ в облаке использую terraform (main.tf). Для установки docker использую ansible (docker.yml)

![answer8](https://github.com/Vasiliy-Ser/Introduction_to_Terraform_16.1/blob/b20a3d42d8a961b66f7a56eff8fb44bcf9e2e35d/png/2.1.png)

2. Для запуска mysql создал docker_context.tf. Проверка наличия секретных env-переменных

![answer9](https://github.com/Vasiliy-Ser/Introduction_to_Terraform_16.1/blob/b20a3d42d8a961b66f7a56eff8fb44bcf9e2e35d/png/2.2.png)


### Задание 3*
1. Установите [opentofu](https://opentofu.org/)(fork terraform с лицензией Mozilla Public License, version 2.0) любой версии
2. Попробуйте выполнить тот же код с помощью ```tofu apply```, а не terraform apply.
------

