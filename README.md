### Dockerfile
Este archivo define la imagen de Docker para la aplicación y contiene lo siguiente:

```
# Usa una imagen base de Node.js 18 optimizada para Alpine Linux (ligera y segura)
FROM node:18-alpine  

# Define el directorio de trabajo dentro del contenedor
WORKDIR /app  

# Copia los archivos de dependencias y las instala de manera eficiente
COPY package.json package-lock.json ./  
RUN npm install --frozen-lockfile  

# Copia el resto del código fuente de la aplicación
COPY . .  

# Expone el puerto en el que se ejecutará la aplicación
EXPOSE 3000  

# Comando por defecto para iniciar la aplicación en modo desarrollo
CMD ["npm", "run", "dev"]  

```
---

### Credenciales de Docker Hub
Para poder subir la imagen al registro de Docker, se generó un **access token** con permisos de lectura y escritura. Luego, estos datos se guardaron como **secrets** en el repositorio:

- `DOCKER_USER`: Usuario de Docker Hub.
- `DOCKER_PASS`: Token generado para autenticación segura.

Esto permite autenticarse sin exponer las credenciales en el código.

---

### Workflow de GitHub Actions
El archivo `.github/workflows/push.yml` define un flujo de trabajo automatizado que se ejecuta al hacer push en `main`.

```
name: Docker Build & Push

on:
  push:
    branches:
      - main

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Authenticate with Docker Hub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PASS }}

      - name: Construct Docker Image
        run: |
          docker build --tag ${{ secrets.DOCKER_USER }}/mi-aplicacion:latest .

      - name: Upload Docker Image
        run: |
          docker push ${{ secrets.DOCKER_USER }}/mi-aplicacion:latest
```
Este workflow permite generar y subir la imagen automáticamente a Docker Hub cada vez que se actualiza la rama `main`. 

![image](https://github.com/user-attachments/assets/6752f6a6-74d3-4666-9a57-516d81d5d075)


# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).
hi

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)
