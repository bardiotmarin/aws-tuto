# Utilise une image Node.js officielle
FROM node:22

# Crée un répertoire de travail
WORKDIR /app

# Copie les fichiers nécessaires
COPY package*.json ./
RUN npm install

# Copie le reste de l'application
COPY . .

ENV port=80
# # Expose le port (à adapter selon ton app)
# EXPOSE 3000
RUN npm run build

# Commande pour démarrer l'app
CMD ["npm", "run", "start:prod"]
