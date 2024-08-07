## dockerLamp
Exemplo de uso do docker compose para criação de um ambiente LAMP

### Inicie os containers:

```
docker-compose up -d
```

### Pare e remova os containers existentes:
```
docker-compose down
```

### Entre no container PHP e verifique se as extensões foram instaladas e habilitadas corretamente:
```
docker exec -it web bash
php -m
```

### Caso precise reconstruir a imagem Docker para garantir que todas as alterações sejam aplicadas:
```docker build -t web .```

### Dentro do container Docker:
```
cd /var/www/html
ls -l
```

### Se necessário, ajuste as permissões:
```
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
```
