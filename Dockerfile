# Sử dụng image Node.js chính thức
FROM node:14

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép các file package.json
COPY package*.json ./

# Cài đặt dependencies
RUN npm install

# Sao chép toàn bộ mã nguồn vào container
COPY . .

# Mở cổng 3000
EXPOSE 3000

# Lệnh chạy ứng dụng
CMD ["npm", "start"]
