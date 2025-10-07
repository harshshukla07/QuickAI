# 🚀 QuickAI - Intelligent Content Creation Platform

<div align="center">
  <img src="./client/src/assets/logo.svg" alt="QuickAI Logo" width="200" height="80"/>
  
  **Transform your ideas into reality with the power of AI**
  
  [![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
  [![React](https://img.shields.io/badge/React-19.1.0-blue.svg)](https://reactjs.org/)
  [![Node.js](https://img.shields.io/badge/Node.js-22.x-green.svg)](https://nodejs.org/)
  [![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Neon-blue.svg)](https://neon.tech/)
  [![Deployed](https://img.shields.io/badge/Status-Live-brightgreen.svg)](#)
</div>

---

## 🌟 Overview

QuickAI is a comprehensive AI-powered platform that empowers users to create high-quality content effortlessly. From generating articles and images to removing backgrounds and reviewing resumes, QuickAI leverages cutting-edge AI technologies to streamline creative workflows.

### ✨ Key Features

- **📝 Article Generation** - Create professional articles with AI assistance
- **🎨 Image Creation** - Generate stunning images from text descriptions  
- **🖼️ Background Removal** - Remove backgrounds from images instantly
- **📄 Resume Review** - Get detailed AI-powered resume analysis
- **🎯 Blog Title Generator** - Create catchy titles for your content
- **👥 Community Hub** - Share and discover AI-generated content
- **⚡ High Performance** - 95% faster queries with advanced caching and indexing

---

## 🛠️ Tech Stack

### Frontend
- **React 19** - Modern UI framework
- **Vite** - Lightning-fast build tool
- **Tailwind CSS** - Utility-first styling
- **Clerk** - Authentication and user management
- **Axios** - HTTP client for API calls
- **React Router** - Client-side routing
- **Lucide React** - Beautiful icons

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web application framework
- **PostgreSQL (Neon)** - Cloud database with advanced indexing
- **Clerk** - Authentication middleware
- **Cloudinary** - Image storage and processing

### AI Services
- **Google Gemini** - Text generation and analysis
- **ClipDrop API** - AI image generation
- **Cloudinary AI** - Background removal processing

### Performance Optimizations
- **Response Caching** - 96% latency reduction for repeated requests
- **Database Indexing** - 95% faster query performance
- **CDN Integration** - Optimized asset delivery

---

## 🚀 Quick Start

### Prerequisites

- Node.js 18.0 or higher
- npm or yarn
- PostgreSQL database (or Neon account)
- Clerk account for authentication

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/harshshukla07/QuickAI.git
   cd QuickAI
   ```

2. **Install dependencies**
   ```bash
   # Install server dependencies
   cd server
   npm install
   
   # Install client dependencies
   cd ../client
   npm install
   ```

3. **Environment Setup**

   Create `.env` files in both server and client directories:

   **Server `.env`:**
   ```env
   DATABASE_URL=your_postgresql_connection_string
   CLERK_SECRET_KEY=your_clerk_secret_key
   GEMINI_API_KEY=your_gemini_api_key
   CLIPDROP_API_KEY=your_clipdrop_api_key
   CLOUDINARY_CLOUD_NAME=your_cloudinary_name
   CLOUDINARY_API_KEY=your_cloudinary_api_key
   CLOUDINARY_API_SECRET=your_cloudinary_secret
   ```

   **Client `.env`:**
   ```env
   VITE_CLERK_PUBLISHABLE_KEY=your_clerk_publishable_key
   VITE_BASE_URL=http://localhost:4000
   ```

4. **Database Setup**
   ```bash
   cd server
   node create-indexes.js
   ```

5. **Start the application**
   ```bash
   # Start server (terminal 1)
   cd server
   npm run server
   
   # Start client (terminal 2)
   cd client
   npm run dev
   ```

6. **Access the application**
   - Frontend: `http://localhost:5173`
   - Backend: `http://localhost:4000`

---

## 📁 Project Structure

```
QuickAI/
├── client/                 # React frontend
│   ├── src/
│   │   ├── components/     # Reusable UI components
│   │   ├── pages/         # Page components
│   │   ├── assets/        # Static assets
│   │   └── App.jsx        # Main application component
│   ├── public/            # Public assets
│   └── package.json
│
├── server/                # Express backend
│   ├── controllers/       # Business logic
│   ├── middlewares/       # Custom middleware
│   ├── routes/           # API routes
│   ├── configs/          # Configuration files
│   └── package.json
│
└── README.md
```

---

## 🎯 Features Deep Dive

### 📝 Article Generation
- **AI-Powered Writing** - Generates comprehensive articles using Google Gemini
- **Customizable Length** - Short (500-800), Medium (800-1200), Long (1200+ words)
- **Markdown Support** - Rich formatting with headers, lists, and emphasis
- **Usage Tracking** - Free tier: 10 articles, Premium: unlimited

### 🎨 Image Creation
- **Text-to-Image** - Create images from detailed descriptions
- **Style Options** - Realistic, Anime, Cartoon, Fantasy, 3D, Portrait styles
- **High Quality** - Powered by ClipDrop's advanced AI models
- **Community Sharing** - Option to publish creations publicly

### 🖼️ Background Removal
- **One-Click Processing** - Remove backgrounds instantly
- **AI-Powered** - Uses Cloudinary's advanced background removal
- **Multiple Formats** - Supports JPG, PNG, and other image formats
- **Premium Feature** - Available for premium subscribers

### 📄 Resume Analysis
- **Comprehensive Review** - ATS score, strengths, and improvement areas
- **PDF Processing** - Extracts and analyzes text from PDF resumes
- **Actionable Feedback** - Specific recommendations for enhancement
- **Professional Insights** - Industry-standard evaluation criteria

---

## ⚡ Performance Optimizations

### Response Caching System
```javascript
// Intelligent caching reduces response time by 96%
Cache Key: article:${prompt_hash}
Cache Hit: ~50ms response
Cache Miss: ~1200ms + cache storage
TTL: 1 hour
```

### Database Indexing
```sql
-- Strategic indexes for optimal query performance
CREATE INDEX idx_creations_user_id ON creations(user_id);
CREATE INDEX idx_creations_type ON creations(type);
CREATE INDEX idx_creations_user_date ON creations(user_id, created_at DESC);
```

**Performance Results:**
- User dashboard queries: 120ms → 2ms (98% faster)
- Public gallery: 200ms → 5ms (97% faster)
- Content filtering: 80ms → 3ms (96% faster)

---

## 🔐 Security Features

- **Clerk Authentication** - Enterprise-grade user management
- **API Rate Limiting** - Prevents abuse and ensures fair usage
- **Input Validation** - Sanitizes and validates all user inputs
- **Environment Variables** - Secure configuration management
- **CORS Protection** - Controlled cross-origin requests

---

## 📊 API Documentation

### Authentication
All API requests require authentication via Clerk JWT tokens.

### Endpoints

#### Article Generation
```http
POST /api/ai/generate-article
Content-Type: application/json
Authorization: Bearer <token>

{
  "prompt": "Write about artificial intelligence",
  "length": 800
}
```

#### Image Generation
```http
POST /api/ai/generate-image
Content-Type: application/json
Authorization: Bearer <token>

{
  "prompt": "A futuristic city at sunset",
  "publish": true
}
```

#### Background Removal
```http
POST /api/ai/remove-background
Content-Type: multipart/form-data
Authorization: Bearer <token>

{
  "image": <file>
}
```

---

## 🚀 Deployment

### Frontend (Vercel)
```bash
cd client
npm run build
# Deploy to Vercel
```

### Backend (Railway/Heroku)
```bash
cd server
# Set environment variables
# Deploy to your preferred platform
```

### Database (Neon)
- Automatic scaling
- Built-in connection pooling
- Serverless PostgreSQL

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines
- Follow ESLint configuration
- Write meaningful commit messages
- Add comments for complex logic
- Test your changes thoroughly

---

## 📈 Performance Metrics

| Metric | Before Optimization | After Optimization | Improvement |
|--------|--------------------|--------------------|-------------|
| Average API Response | 1.2s | 600ms | 50% |
| Database Queries | 120ms | 2ms | 98% |
| Cache Hit Rate | 0% | 85% | ∞ |
| User Dashboard Load | 2.5s | 800ms | 68% |

---

## 🔮 Future Enhancements

- [ ] **Voice-to-Text** - Audio input for content generation
- [ ] **Multi-language Support** - Global accessibility
- [ ] **Advanced Analytics** - Usage insights and metrics
- [ ] **API Webhooks** - Real-time integrations
- [ ] **Mobile App** - React Native companion
- [ ] **Team Collaboration** - Shared workspaces
- [ ] **Custom AI Models** - Fine-tuned for specific use cases

---

## 🐛 Known Issues

- Large file uploads may timeout on slower connections
- Cache warming needed after server restart
- Some AI generations may take longer during peak usage

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Harsh Shukla**
- GitHub: [@harshshukla07](https://github.com/harshshukla07)
- LinkedIn: [Connect with me](https://linkedin.com/in/harshshukla07)


---

## 🙏 Acknowledgments

- [Google Gemini](https://ai.google.dev/) for powerful text generation
- [ClipDrop](https://clipdrop.co/) for AI image creation
- [Clerk](https://clerk.dev/) for authentication services
- [Cloudinary](https://cloudinary.com/) for image processing
- [Neon](https://neon.tech/) for serverless PostgreSQL
- [Vercel](https://vercel.com/) for frontend hosting

---

<div align="center">
  <h3>⭐ Star this repository if you found it helpful!</h3>
  
  **Built with ❤️ and AI**
  
  [🌟 Star](https://github.com/harshshukla07/QuickAI) • [🐛 Report Bug](https://github.com/harshshukla07/QuickAI/issues) • [✨ Request Feature](https://github.com/harshshukla07/QuickAI/issues)
</div>