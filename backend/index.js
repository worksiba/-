const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');
const morgan = require('morgan');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());

// DB Connection Pool
const pool = mysql.createPool({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'wedding_expo',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// Routes
// 1. 박람회 리스트 조회
app.get('/api/expos', async (req, res) => {
    try {
        const [rows] = await pool.query('SELECT * FROM expos WHERE status = "active" ORDER BY date_start ASC');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal Server Error' });
    }
});

// 2. 박람회 상세 조회
app.get('/api/expos/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const [rows] = await pool.query('SELECT * FROM expos WHERE id = ?', [id]);
        if (rows.length === 0) return res.status(404).json({ message: 'Expo not found' });
        res.json(rows[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal Server Error' });
    }
});

// 3. 초대권 신청 통합
app.post('/api/apply', async (req, res) => {
    try {
        const { expo_id, name, phone, email, visit_date } = req.body;
        if (!expo_id || !name || !phone) {
            return res.status(400).json({ message: 'Missing required fields' });
        }

        const [result] = await pool.query(
            'INSERT INTO applications (expo_id, name, phone, email, visit_date) VALUES (?, ?, ?, ?, ?)',
            [expo_id, name, phone, email, visit_date]
        );

        res.status(201).json({ message: 'Application submitted successfully', id: result.insertId });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Internal Server Error' });
    }
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
