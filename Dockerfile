# Usar una imagen base de Node
FROM node:16

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos de package.json y package-lock.json
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto de los archivos del proyecto
COPY . .

# Construir la aplicación para producción
RUN npm run build

# Instalar un servidor estático para servir la aplicación
RUN npm install -g serve

# Exponer el puerto 3000
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["start", "npm"]
