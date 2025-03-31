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
