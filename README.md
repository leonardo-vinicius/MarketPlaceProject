# Projeto Marketplace

Projeto feito utilizando Ruby on Rails e bootstrap

### Autenticação:

Uso da gem `devise-i18n`, uma das soluções mais completas e amplamente 
utilizadas na comunidade Ruby on Rails. O Devise oferece uma série de 
funcionalidades essenciais para a gestão de usuários.

- Esquema banco de dados

    ![image](./read_me_images/image.png)
    
**CRUD de todos os modelos** 

- Tela de Login: → **POST**  `/users/sign_in`
    
    ![image](./read_me_images/image_1.png)
    
- Tela de criação de usuário → **POST** `/users/sign_up`
    
   ![image](./read_me_images/image_2.png)
    
- Tela principal
    
    ![image](./read_me_images/image_3.png)
    
- Tela de detalhes de uma empresa → **GET** `/softwares/[:id]`
    
    ![image](./read_me_images/image_4.png)
    
- Tela de Informações do usuário → **GET** `/users/current_user[:id]`
    
    ![image](./read_me_images/image_5.png)
