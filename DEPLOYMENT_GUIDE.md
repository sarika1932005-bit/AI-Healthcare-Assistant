# 🌐 Deployment Guide: Connecting to Your GoDaddy Domain

Since you have a **React Frontend** and a **Python Backend**, you can't just "upload" files to GoDaddy like a simple HTML site. You need a server to run the Python code.

Here is the **easiest, free way** to get your site online and connected to your domain:

## 🏗️ The Architecture
1. **Frontend (React)** → Hosted on **Vercel** (Free, fastest for React)
2. **Backend (Python)** → Hosted on **Render** (Free, easy for Python)
3. **Domain (GoDaddy)** → Pointed to **Vercel**

---

## 🚀 Step 1: Deploy Backend (Render)

1. **Push your code to GitHub** (if you haven't already).
2. Go to [Render.com](https://render.com) and sign up.
3. Click **"New +"** → **"Web Service"**.
4. Connect your GitHub repository.
5. **Settings:**
   - **Name:** `healthcare-backend`
   - **Root Directory:** `backend`
   - **Environment:** `Python 3`
   - **Build Command:** `pip install -r requirements.txt && pip install -r requirements-ml.txt`
   - **Start Command:** `uvicorn app.main:app --host 0.0.0.0 --port 10000`
6. Click **"Create Web Service"**.
7. Wait for it to deploy. You'll get a URL like `https://healthcare-backend.onrender.com`.
   - **Copy this URL!** You need it for the frontend.

---

## 🎨 Step 2: Prepare Frontend

1. Open `healthcare-chatbot/src/api/api.js` (or wherever you defined the base URL).
2. Change the local URL to your new Render URL:
   ```javascript
   // Old
   const API_URL = "http://localhost:8000";
   
   // New (Example)
   const API_URL = "https://healthcare-backend.onrender.com";
   ```
3. Commit and push these changes to GitHub.

---

## ⚡ Step 3: Deploy Frontend (Vercel)

1. Go to [Vercel.com](https://vercel.com) and sign up.
2. Click **"Add New..."** → **"Project"**.
3. Import your GitHub repository.
4. **Settings:**
   - **Framework Preset:** Create React App (should detect automatically)
   - **Root Directory:** `healthcare-chatbot` (Edit this!)
5. Click **"Deploy"**.
6. Wait a minute. You'll get a URL like `https://healthcare-chatbot.vercel.app`.

---

## 🔗 Step 4: Connect GoDaddy Domain

Now, let's make `www.yourdomain.com` show your project!

1. **In Vercel:**
   - Go to your Project Dashboard.
   - Click **"Settings"** → **"Domains"**.
   - Enter your domain (e.g., `yourdomain.com`) and click **Add**.
   - Vercel will show you some **DNS Records** (A Record and CNAME).

2. **In GoDaddy:**
   - Log in and go to **"My Products"**.
   - Click **"DNS"** next to your domain.
   - **Add/Edit these records** to match what Vercel showed you:
     - **Type:** `A` | **Name:** `@` | **Value:** `76.76.21.21` (Vercel's IP)
     - **Type:** `CNAME` | **Name:** `www` | **Value:** `cname.vercel-dns.com`

3. **Wait:** DNS changes can take 1-24 hours (usually 1 hour).

---

## 🎉 Result
- User types `www.yourdomain.com` → Sees your **React App**.
- React App talks to `healthcare-backend.onrender.com` → Gets **AI Diagnosis**.

**You are now live!** 🚀
