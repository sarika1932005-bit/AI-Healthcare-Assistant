# Quick Start - AI Healthcare Assistant

## For Your Friend: 3-Step Setup

### Step 1: Install Prerequisites
1. Install Python 3.8+: https://www.python.org/downloads/
2. Install Node.js 16+: https://nodejs.org/

### Step 2: Install Dependencies

**Backend:**
```bash
cd backend
pip install -r requirements.txt
pip install -r requirements-ml.txt
```

**Frontend:**
```bash
cd healthcare-chatbot
npm install
```

### Step 3: Run the App

**Terminal 1 - Backend:**
```bash
cd backend
uvicorn app.main:app --reload --port 8000
```

**Terminal 2 - Frontend:**
```bash
cd healthcare-chatbot
npm start
```

**Open:** http://localhost:3000

---

## That's It! 🎉

- First run downloads BioBERT model (~5-10 min)
- Subsequent runs are instant
- Check README.md for full documentation

---

## Quick Test

```bash
cd backend
pytest tests/test_accuracy.py -v -s
```

Shows 50 test cases with accuracy metrics!

---

## Features to Demo

1. **Symptom Diagnosis** - Try: "severe headache with nausea"
2. **Image Analysis** - Upload chest X-ray (if installed)
3. **Testing** - Run pytest to show validation
4. **API Docs** - Visit http://localhost:8000/docs

---

**Need help?** Check SETUP_GUIDE_FOR_FRIEND.md for detailed instructions!
