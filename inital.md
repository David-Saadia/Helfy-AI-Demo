# Helfy AI E-commerce Demo - Project Documentation

## 🤖 AI Generation Instructions

This project was generated using AI assistance. Below is the primary instruction set that initiated the project generation. This establishes the architecture, defines the stack, and guides the AI through building the core features end-to-end.

### **Primary Instruction Set:**

> "Let's setup the back end server to support our front end e-commerce react application.
> 
> The back end server is going to use node.js, with express. For the database we will use a MySql local server.
> 
> The server will live in the folder named server at the root level of the project.
> 
> Please generate a boiler plate server file, initializing"

### **What This Generated:**

From this instruction, the AI created:
1. ✅ Complete Node.js/Express backend server with RESTful API architecture
2. ✅ MySQL database configuration with connection pooling
3. ✅ MVC pattern implementation (Models via database, Controllers, Routes)
4. ✅ Three main resource endpoints: Products, Users, Orders
5. ✅ JWT-based authentication system with password hashing
6. ✅ Complete database schema with 5 tables and sample data
7. ✅ Docker containerization for development and deployment
8. ✅ Security features: CORS, parameterized queries, environment variables
9. ✅ Comprehensive documentation and setup instructions

### **Subsequent Enhancements:**
- Docker and docker-compose setup for multi-service orchestration
- Complete project documentation (this file)
- Environment configuration templates
- Development and production deployment strategies

### **Phase 2 Instruction Set - Advanced Features:**

> "Now I want to handle middlewares on the server, upon authenticated requests from the client, I want the server to utilize a middleware to ensure a JWT token exists and is valid.
>
> Next task is to allow for filter, sort and search capabilities (routes) for the product table. Right now it's missing sort and search routes.
>
> Next, I want to add a connection between the users table and the products table under the name Cart. This table will basically serve as a persistent cart that will allow the user at the front to pull back all of the items he added to his cart across login sessions.
>
> Then, create a new table named order_history, this table will list all order history per user so the user will be able to access past orders from the client."

**What Phase 2 Generated:**

1. ✅ **Authentication Middleware** (`middleware/auth.js`)
   - JWT token verification from Authorization header
   - Bearer token format validation
   - Token expiration handling
   - Optional authentication middleware for public/private routes
   - User context injection into requests (req.user)

2. ✅ **Enhanced Product Search & Filtering**
   - Search by name, description, or category
   - Filter by category, price range (min/max)
   - Sort by: id, name, price, category, stock, created_at
   - Ascending/Descending order support
   - Pagination with limit and offset
   - Get all categories endpoint
   - Dedicated search endpoint with relevance ranking

3. ✅ **Persistent Cart System**
   - Full CRUD operations for cart items
   - Get user's cart with product details and totals
   - Add items to cart with stock validation
   - Update cart item quantities
   - Remove individual items or clear entire cart
   - Automatic cart merging (if item exists, updates quantity)
   - Persistent across login sessions
   - Database indexes for performance

4. ✅ **Order History**
   - View complete order history for authenticated users
   - Get detailed order information with items
   - Order statistics (total spent, average order value, etc.)
   - Cancel orders (pending/processing only)
   - Order status tracking (pending, processing, shipped, delivered, cancelled)

**Security Enhancements:**
- All cart and order history routes protected by authentication
- Product creation/update/delete protected by authentication
- User-specific data isolation (users can only access their own cart/orders)
- Proper authorization checks on all protected routes

### **Phase 3 Instruction Set - Frontend UI:**

> "Let's now move to the front end in react under the @/frontend folder.

The tasks and the way the page will be built are as follows:

1. Create the main and login screen:
- Create a main component that will live under the @/frontend\src\App.js , this will serve as a main container for the application.

- Within the main component, we will check if a user has logged in:
If a user hasn't logged in, we will display the login component. If a user has logged in, we will display the home component.

- The login page and the home page will live under a folder named pages

- Within the login page will live a centered container that will list two fields, email and password. The fields will follow each other vertically. The password field will have a toggle view password button embeded into the field's box.
Underneath the fields, there will be a wide login button.
Underneath the login button, there will be a sign up button. Upon login pressed, transfer a request to the back end server using axios. Upon success, the user will be transferred to the home page.

- The register button will lead to a register page that will contain the same container like the login page, and will list all of the fields from the user schema on the back end server. Then have a register button at the bottom in a similiar style to the login page. Upon register clicked, use axios to process the request on the back end server. Upon success the user will be transferred to the home page.

Please make a customizable container component, a field component, and a submit button component that can be recycled through out the front end application.

- On error, the user will be displayed with a popup modal alerting the problem in a user friendly tone.
Please create a customizable reuseable pop up modal component that can be closed when clicked outside of the shown area or the x button.

2. Create a home screen.
The home screen will look like so:
- At the top of the page there will be a naviagation bar that will host a logo pushed to the left, and a container containing a profile button, and a cart button component pushed to the right.

- The cart button component will open up a docked scrollable container to the right of the page.

- The cart container will overlap the page, and will house a list of card components of items.

- Underneath the navigation bar, will live the home page container.

The home page container will be divided to two sections:

- Search and filter section
- Items cards section
Within the items cards section the layout will be of grid, with 3 columns.

Please make sure: Every component has it's own folder, and composed from a css file, and a js file.

3. Please add global context component for the user, and the cart, so we can reuse it in the components freely without needing to use too much logic.

As a final step, review your work, ensure all designs work with each other, and add this and the last instruction to the @/README.md file. This file purpose is to detail all AI interactions."

**What Phase 3 Generated:**

1. ✅ **State Management via Context** (`UserContext`, `CartContext`) handling authentication and persistent cart fetching.
2. ✅ **Reusable UI Component System**
   - `Container`: Wraps pages for consistent responsive widths.
   - `InputField`: Integrated inputs with secure password toggle button.
   - `Button`: Standardized submission and action triggers.
   - `Modal`: Customizable reusable alert/dialog system that closes smoothly.
3. ✅ **Protected Routing Strategy** via React-Router enforcing login requirements.
4. ✅ **Dashboard and Navigation** (`Home`, `Navbar`, `CartDrawer`) rendering searchable CSS Grid of products and a docking side-cart.

### **Phase 4 Instruction Set - Final Polish & Refactoring:**

> "View the code right now in @/frontend . Please ensure there is no code repetation, and all components reference each other correctly through the directory hireachy.
> 
> Afterwards, touch up and make sure the design works well following the last instruction from @/inital.md .
> 
> Create a AxiosInstance file to incupsulate all base axios logic.
> 
> As a final step, create mock data on the server side and prepare the whole application so it can be viewed and tested on the browser correctly."

**What Phase 4 Generated:**
1. ✅ **Axios Instance**: Created `axiosInstance.js` to centralize `baseURL` and authentication interceptors.
2. ✅ **Refactored Components**: Replaced repetitive `axios` logic across `Login`, `Register`, `UserContext`, and `CartContext` to utilize the customized Axios instance.
3. ✅ **Enhanced Design & Features**: Added the actual "Add to Cart" functionality on product cards, populated grid styles, and added image placeholders in the home page.
4. ✅ **Mock Data Initialization**: Created robust initialization script in `schema.sql` injecting products and a default test user `test@example.com` (password: `password123`) to allow immediate testing without registration.
---

## 📋 Project Overview

This is a full-stack e-commerce application built with React (frontend) and Node.js/Express (backend), using MySQL as the database. The application is containerized using [PERSON_NAME] for easy development and deployment.

---

## 🏗️ Architecture

### Tech Stack

**Frontend:**
- React.js
- React Router (for navigation)
- Axios (for API calls)
- CSS3 (styling)

**Backend:**
- Node.js
- Express.js
- MySQL2 (database driver)
- JWT (authentication)
- bcryptjs (password hashing)
- CORS (cross-origin resource sharing)

**Database:**
- MySQL 8.0

**DevOps:**
- Docker
- Docker Compose

---

## 📁 Project Structure

```
Helfy AI Demo/
├── frontend/                    # React frontend application
│   ├── public/                  # Public assets
│   ├── src/                     # Source code
│   ├── package.json             # Frontend dependencies
│   └── README.md                # Frontend documentation
│
├── server/                      # Node.js backend application
│   ├── config/                  # Configuration files
│   │   └── database.js          # MySQL connection pool
│   ├── controllers/             # Business logic
│   │   ├── productController.js
│   │   ├── userController.js
│   │   └── orderController.js
│   ├── routes/                  # API route definitions
│   │   ├── productRoutes.js
│   │   ├── userRoutes.js
│   │   └── orderRoutes.js
│   ├── database/                # Database schemas
│   │   └── schema.sql           # Database structure & seed data
│   ├── .env.example             # Environment variables template
│   ├── .gitignore               # Git ignore rules
│   ├── package.json             # Backend dependencies
│   ├── server.js                # Main server entry point
│   └── README.md                # Backend documentation
│
├── Dockerfile                   # Docker image definition
├── docker-compose.yml           # Multi-container orchestration
├── .dockerignore                # Docker ignore rules
├── .env.docker                  # Docker environment template
├── package.json                 # Root package.json
├── README.md                    # Main project documentation
└── inital.md                    # This file - setup instructions

```

---

## 🚀 Getting Started

### Prerequisites

- **Node.js** (v14 or higher)
- **npm** or **yarn**
- **MySQL** (v5.7 or higher) - OR use Docker
- **Docker & Docker Compose** (recommended for easy setup)

---

## 🐳 Option 1: Docker Setup (Recommended)

Docker provides the easiest way to get started with all services running.

### Step 1: Clone or Download the Project

```bash
cd "e:\Scripting_Projects\Full Stack React Demos\Helfy AI Demo"
```

### Step 2: Create Environment File

```bash
# Copy the Docker environment template
copy .env.docker .env
```

Edit the `.env` file and update the values, especially the JWT_SECRET in production.

### Step 3: Build and Start Services

```bash
# Build and start all services (MySQL, Backend, Frontend)
docker-compose up --build
```

Or run in detached mode:
```bash
docker-compose up -d
```

### Step 4: Access the Application

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:5000
- **MySQL**: localhost:3306

### Docker Commands

```bash
# Stop all services
docker-compose down

# View logs
docker-compose logs -f

# View specific service logs
docker-compose logs -f backend

# Rebuild services
docker-compose up --build

# Remove volumes (WARNING: deletes database data)
docker-compose down -v
```

---

## 💻 Option 2: Local Development Setup (Without Docker)

### Step 1: Install Dependencies

#### Backend:
```bash
cd server
npm install
```

#### Frontend:
```bash
cd frontend
npm install
```

### Step 2: Set Up MySQL Database

1. Install and start MySQL server
2. Create the database:

```bash
# Login to MySQL
mysql -u root -p

# Run the schema file
source server/database/schema.sql
```

Or manually execute the SQL:
```sql
CREATE DATABASE helfy_ecommerce;
```

Then run the contents of `server/database/schema.sql`

### Step 3: Configure Environment Variables

```bash
cd server
copy .env.example .env
```

Edit `.env` with your MySQL credentials:
```env
PORT=5000
NODE_ENV=development
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=helfy_ecommerce
DB_PORT=3306
JWT_SECRET=your_secure_random_string
FRONTEND_URL=http://localhost:3000
```

### Step 4: Start the Backend Server

```bash
cd server

# Development mode (with auto-reload)
npm run dev

# OR Production mode
npm start
```

The server will start on http://localhost:5000

### Step 5: Start the Frontend

```bash
cd frontend
npm start
```

The React app will open on http://localhost:3000

---

## 🔌 API Endpoints

### Products (Public & Protected)
- `GET /api/products` - Get all products (supports search, filter, sort, pagination)
  - Query params: `search`, `category`, `minPrice`, `maxPrice`, `sortBy`, `order`, `limit`, `offset`
- `GET /api/products/search?q=query` - Search products by name/description/category
- `GET /api/products/categories` - Get all unique product categories
- `GET /api/products/category/:category` - Get products by specific category
- `GET /api/products/:id` - Get product by ID
- `POST /api/products` - Create new product 🔒 (requires authentication)
- `PUT /api/products/:id` - Update product 🔒 (requires authentication)
- `DELETE /api/products/:id` - Delete product 🔒 (requires authentication)

### Users (Authentication)
- `POST /api/users/register` - Register new user
- `POST /api/users/login` - User login (returns JWT token)
- `GET /api/users/:id` - Get user by ID
- `PUT /api/users/:id` - Update user
- `DELETE /api/users/:id` - Delete user

### Cart 🔒 (All routes require authentication)
- `GET /api/cart` - Get user's cart with product details and totals
- `POST /api/cart` - Add item to cart (or update quantity if exists)
  - Body: `{ "product_id": 1, "quantity": 2 }`
- `PUT /api/cart` - Update cart item quantity
  - Body: `{ "product_id": 1, "quantity": 3 }`
- `DELETE /api/cart/:product_id` - Remove specific item from cart
- `DELETE /api/cart/clear` - Clear entire cart

### Orders
- `GET /api/orders` - Get all orders
- `GET /api/orders/:id` - Get order by ID
- `GET /api/orders/user/:userId` - Get orders by user ID
- `POST /api/orders` - Create new order
- `PUT /api/orders/:id` - Update order status
- `DELETE /api/orders/:id` - Delete order

### Order History 🔒 (All routes require authentication)
- `GET /api/order-history` - Get user's complete order history
- `GET /api/order-history/stats` - Get user's order statistics
- `GET /api/order-history/:orderId` - Get detailed order with items
- `PUT /api/order-history/:orderId/cancel` - Cancel an order (pending/processing only)

### Health Check
- `GET /health` - Server health status
- `GET /` - API info and available endpoints

**🔒 = Authentication Required**
Include JWT token in header: `Authorization: Bearer <token>`

---

## 🗄️ Database Schema

### Tables

1. **users** - User accounts and authentication
   - Fields: id, username, email, password (hashed), [PERSON_NAME], [ADDRESS], timestamps
   
2. **products** - Product catalog with categories
   - Fields: id, name, description, price, category, stock, image_url, timestamps
   - Indexes: category, price for fast filtering and sorting
   
3. **orders** - Customer orders with status tracking
   - Fields: id, user_id, total_amount, status, shipping_address, timestamps
   - Status: pending, processing, shipped, delivered, cancelled
   - Indexes: user_id, status, created_at for fast queries
   
4. **order_items** - Individual products in each order
   - Fields: id, order_id, product_id, quantity, price, created_at
   - Indexes: order_id, product_id for fast joins
   
5. **cart** - Persistent shopping cart across sessions
   - Fields: id, user_id, product_id, quantity, timestamps
   - Unique constraint: (user_id, product_id) to prevent duplicates
   - Indexes: user_id, product_id for fast lookups

**Key Features:**
- Cascade deletes for data integrity
- Database indexes for optimized query performance
- Timestamps for audit trails
- Foreign key constraints for referential integrity

See `server/database/schema.sql` for full schema details.

---

## 🔒 Security Features

- **Password Hashing**: bcryptjs with salt rounds
- **JWT Authentication**: Secure token-based auth
- **CORS Protection**: Configured for specific origins
- **SQL Injection Prevention**: Parameterized queries
- **Environment Variables**: Sensitive data in .env files

---

## 🧪 Testing the API

### Using curl:

```bash
# Get all products
curl http://localhost:5000/api/products

# Register a new user
curl -X POST http://localhost:5000/api/users/register \
  -H "Content-Type: application/json" \
  -d '{"username":"testuser","email":"test@example.com","password":"password123"}'

# Login
curl -X POST http://localhost:5000/api/users/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"password123"}'
```

### Using Postman or Insomnia:

Import the endpoints and test with a REST client.

---

## 📦 Deployment

### Production Considerations

1. **Environment Variables**: Update JWT_SECRET and database credentials
2. **HTTPS**: Use SSL/TLS certificates
3. **Database**: Use managed database service or secure your MySQL instance
4. **Logging**: Implement proper logging (Winston, Morgan)
5. **Error Handling**: Enhanced error tracking (Sentry)
6. **Rate Limiting**: Add rate limiting middleware
7. **Static Files**: Serve React build files from backend

### Docker Production Build

```bash
# Set NODE_ENV to production in .env
NODE_ENV=production

# Build and run
docker-compose up -d
```

---

## 🐛 Troubleshooting

### Database Connection Issues
- Verify MySQL is running: `docker-compose ps` or check local MySQL service
- Check credentials in `.env` file
- Ensure database exists: `CREATE DATABASE helfy_ecommerce;`
- Check firewall settings allowing port 3306

### Port Already in Use
- Change PORT in `.env` file
- Kill process using the port:
  ```bash
  # Windows
  netstat -ano | findstr :5000
  taskkill /PID <PID> /F
  ```

### Frontend Can't Connect to Backend
- Verify backend is running on port 5000
- Check CORS settings in `server/server.js`
- Ensure `REACT_APP_API_URL` is set correctly

### Docker Issues
- Clear Docker cache: `docker system prune -a`
- Remove volumes: `docker-compose down -v`
- Check logs: `docker-compose logs -f`

---

## 📝 Development Notes

### Made By
Created for Helfy AI Demo - Full Stack React E-commerce Application

### Version History

**v1.0.0** - Initial Setup (Phase 1)
- Node.js/Express backend with RESTful API
- MySQL database with complete schema
- Docker containerization
- JWT authentication
- Product, User, and Order management
- Sample data included

**v2.0.0** - Advanced Features (Phase 2)
- JWT authentication middleware for protected routes
- Advanced product search, filter, and sort capabilities
- Persistent shopping cart system
- Order history with statistics and cancellation
- Database performance indexes
- Enhanced security and authorization

**v3.0.0** - Frontend Implementation (Phase 3)
- Established frontend structural architecture under `/frontend/src`
- Reusable customized UI Components (Input Fields, Modals, Buttons)
- Global context implementations for User Auth and Shopping Cart
- Integrated React Router mapping (`/login`, `/register`, `/`)
- Fully stylized 3-column e-commerce grid layouts
- Absolute-positioned Docked Cart UI panel
- Connected Axios instances to the NodeJS backend

**v4.0.0** - Refactoring & Data Setup (Phase 4)
- Built central `axiosInstance` for request interceptors and DRY calls
- Refactored all API network requests site-wide
- Injected Mock E-commerce product catalog to MySQL schema
- Added images and UI enhancements to product cards

### Future Enhancements
- [ ] Add authentication middleware for protected routes
- [ ] Implement refresh tokens
- [ ] Add image upload functionality
- [ ] Payment gateway integration
- [ ] Email notifications
- [ ] Admin dashboard
- [ ] Product reviews and ratings
- [ ] Search and filtering
- [ ] Pagination
- [ ] Unit and integration tests

---

## 📄 License

ISC

---

## 🤝 Contributing

1. Fork the project
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

---

## 📞 Support

For issues and questions, please refer to the README files in each subdirectory:
- Backend: `server/README.md`
- Frontend: `frontend/README.md`

---

**Last Updated**: June 9, 2026
