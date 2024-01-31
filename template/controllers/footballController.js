require('dotenv').config();
var mysql = require('mysql');

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE
});

// Attempt to connect to the database
connection.connect((err) => {
    if (err) {
        console.error('Error connecting to database:', err);
        return;
    }
    console.log('Connected to the database');
});

// Handle database connection errors
connection.on('error', (err) => {
    console.error('Database error:', err);
});
const executeSQL = (query, params) => {
    return new Promise((resolve, reject) => {
        connection.query(query, params, function (error, results, fields) {
            error ? reject(error) : resolve(results);
        });
    })
}

const getEvents = () => {
    let query = `
        SELECT 
            DATE_FORMAT(aika, '%d.%m.%Y') AS aika, 
            kuvaus
        FROM tapahtuma
        WHERE aika > NOW();
    `;
    let params = [];

    return executeSQL(query, params);
}

const getLeagueTable = () => {
    let query = `
        SELECT
            j.nimi,
            j.kaupunki,
            j.perustamisvuosi,
            st.ottelumaara AS ottelut,
            st.voittoja AS voitot,
            st.tappioita AS tappiot,
            st.tasapeleja AS tasapelit,
            SUM(st.tehdyt_maalit - st.paastetyt_maalit) AS maaliero,
            st.pisteet
        FROM sarjataulukko st
        JOIN joukkue j ON j.id = st.joukkue_id
        GROUP BY j.nimi, j.kaupunki, j.perustamisvuosi, st.ottelumaara, st.voittoja, st.tappioita, st.tasapeleja, st.pisteet;
    `;
    let params = [];

    return executeSQL(query, params);
}

const getPlayers = () => {
    let query = `SELECT * FROM pelaaja;`;
    let params = [];

    return executeSQL(query, params);
}

const getTeams = () => {
    let query = `SELECT * FROM joukkue;`;
    let params = [];

    return executeSQL(query, params);
}

const getPlayersOfTeam = (teamId) => {
    let query = `
        SELECT 
            p.*
        FROM pelaaja p
        JOIN joukkue j ON j.id = p.joukkue_id
        WHERE j.id = ?;
    `;
    let params = [teamId];

    return executeSQL(query, params);
}

module.exports = {
    getEvents: () => {
        return getEvents();
    },
    getLeagueTable: () => {
        return getLeagueTable();
    },
    getPlayers: () => {
        return getPlayers();
    },
    getTeams: () => {
        return getTeams();
    },
    getPlayersOfTeam: (teamId) => {
        return getPlayersOfTeam(teamId);
    }
}
