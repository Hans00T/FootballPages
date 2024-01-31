var cons = require('consolidate');
var path = require('path');
var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var jalkapalloController = require('./controllers/footballController');

app.use(bodyParser.json());

var cors = function (req, res, next)
{
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}

app.use(cors);

app.engine('html', cons.handlebars);
app.set('view engine', 'html');
app.set('views', path.join(__dirname, 'views'));

var options = ["Help", "Info", "News", "Management", "Teams"];


//  Gets events from jalkapalloController
app.get('/events', async function(req, res) {
    let events = [];

    try { events = await jalkapalloController.getEvents(); } catch (error) { console.log("ERROR: ", error); }

    res.render('events', {
        events: events,
    });
});

//  Leaguetable
app.get('/leaguetable', async function(req, res) {
    let sarjataulukko = [];

    try { sarjataulukko = await jalkapalloController.getLeagueTable(); } catch (error) { console.log("ERROR: ", error); }

    res.render('leaguetable', {
        sarjat: sarjataulukko,
    });
});

//  Playersandteams
app.get('/playersandteams', async function(req, res) {
    let pelaajat = [];
    let joukkueet = [];

    try { 
        pelaajat = await jalkapalloController.getPlayers();
        joukkueet = await jalkapalloController.getTeams(); 
    } catch (error) { console.log("ERROR: ", error); }

    res.render('playersandteams', {
        players: pelaajat,
        teams: joukkueet,
    });
});

//  teams
app.get('/teams', async function(req, res) {
    let joukkueet = [];

    try { joukkueet = await jalkapalloController.getTeams(); } catch (error) { console.log("ERROR: ", error); }

    res.render('teams', {
        teams: joukkueet,
    });
});

//  players
app.get('/players', async function(req, res) {
    let pelaajat = [];
    let teamId = req.query.teamId;

    try { pelaajat = await jalkapalloController.getPlayersOfTeam(teamId); } catch (error) { console.log("ERROR: ", error); }

    res.render('players', {
        players: pelaajat,
    });
});

//  page
app.get('/', function(req, res) {
    res.render('index', {
        title: 'Jalkapallo',
        options: ["Choose ...", ...options],
    });
});

module.exports = app;
