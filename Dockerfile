# Используйте официальный образ Node.js в качестве базового
FROM node

# Установите рабочую директорию
WORKDIR /app

# Копируйте package.json и package-lock.json
COPY package.json /app

# Установите зависимости
RUN npm install

# Копируйте исходный код приложения
COPY . /app

# Экспортируйте порт, который будет использовать приложение
EXPOSE 3000

# Запустите приложение
CMD ["node", "app.js"]
