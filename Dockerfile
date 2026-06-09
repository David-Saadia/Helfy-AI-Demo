# =============================================================================
# Multi-stage Dockerfile for Helfy AI E-commerce Application
# =============================================================================
# This Dockerfile creates an optimized production build with:
# - Multi-stage build to reduce final image size
# - Frontend build in first stage, backend service in second stage
# - All dependencies documented and versioned
# =============================================================================

# =============================================================================
# Stage 1: Build Frontend
# =============================================================================
# Purpose: Build the React frontend application for production
# Base Image: node:18-alpine (lightweight Node.js 18 on Alpine Linux ~50MB base)
# =============================================================================
FROM node:18-alpine AS frontend-build

# Set working directory for frontend build
WORKDIR /app/frontend

# Copy package files first (enables Docker layer caching)
# If dependencies haven't changed, this layer will be cached
COPY frontend/package*.json ./

# Install frontend dependencies (production + dev for build tools)
# Dependencies include:
# - react: Core React library for UI components
# - react-dom: React rendering for web browsers
# - react-router-dom: Client-side routing for SPA navigation
# - axios: HTTP client for API requests
# - Build tools: webpack, babel (via react-scripts)
RUN npm ci --only=production

# Copy all frontend source code
COPY frontend/ ./

# Build the React application for production
# Creates optimized, minified bundle in /build directory
# - Minification reduces file sizes
# - Code splitting for better performance
# - Asset optimization (images, CSS, JS)
RUN npm run build

# =============================================================================
# Stage 2: Backend Service
# =============================================================================
# Purpose: Run the Node.js/Express backend server
# Base Image: node:18-alpine (same as stage 1 for consistency)
# =============================================================================
FROM node:18-alpine AS backend

# Set working directory for backend
WORKDIR /app

# Copy backend package files first (layer caching optimization)
COPY server/package*.json ./

# Install backend dependencies (production only)
# Key Dependencies:
# - express (^4.18.2): Web framework for building REST API
# - mysql2 (^3.6.0): MySQL database driver with promise support
# - dotenv (^16.3.1): Environment variable management
# - cors (^2.8.5): Cross-Origin Resource Sharing middleware
# - body-parser (^1.20.2): Request body parsing middleware
# - bcryptjs (^2.4.3): Password hashing for security
# - jsonwebtoken (^9.0.2): JWT token generation and verification
# - nodemon (^3.0.1): Auto-restart during development (dev dependency)
RUN npm ci --only=production

# Copy all backend source code
# Includes:
# - server.js: Main application entry point
# - config/: Database and app configuration
# - middleware/: Custom Express middleware (auth, etc.)
# - controllers/: Business logic layer
# - routes/: API endpoint definitions
# - utils/: Helper functions and utilities
COPY server/ ./

# Copy built frontend from stage 1
# Serves static React files from Express server
COPY --from=frontend-build /app/frontend/build ./public

# Expose port 5000 for the API server
# This port is used by the Express application
EXPOSE 5000

# Health check to ensure container is running properly
# Checks the /health endpoint every 30 seconds
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "require('http').get('http://localhost:5000/health', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

# Set NODE_ENV to production for optimizations
# - Disables verbose error messages
# - Enables performance optimizations
# - Changes Express behavior for production
ENV NODE_ENV=production

# Start the Node.js server
# Runs the main server.js file
CMD ["node", "server.js"]
