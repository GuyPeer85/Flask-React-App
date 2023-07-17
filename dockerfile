# ---- Build Stage ----
# Use the base Node.js image for the build stage
FROM node:14 AS build

# Set the working directory
WORKDIR /client

# Copy the package.json and package-lock.json files
COPY client/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY client .

# Build the React application
RUN npm run build

# ---- Run Stage ----
# Use an official Python runtime as a parent image for the run stage
FROM python:3.8-slim-buster

# Set the working directory in the container
WORKDIR /server

# Copy the current directory contents into the container at /app
COPY server ./

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the build folder from build stage
COPY --from=build /client/build ./client/build

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run app.py when the container launches
CMD ["python", "app.py"]
