
var db = require('../config/db_config').connect();

module.exports = function (app) {
    // Viser alle arrangementer på admin siden 
    app.get('/admin/arrangementer', function (req, res) {
        db.query("SELECT arrangementer.* , sale.navn AS 'sal', type.navn AS 'type' FROM(( arrangementer INNER JOIN sale ON Sal_fk = sale.id) INNER JOIN type ON type_fk = type.id)", (error, rows) => {
            db.query('SELECT* FROM type', function (err, data_typer) {
                res.render('pages/admin', {
                    side: "admin",
                    arrangement: rows,
                    typer: data_typer
                });
            })
        });
    })

    // ================================================================

    // Viser arrangementer i en bestemt kategori på Admin siden
    app.get('/admin/:id', function (req, res) {
        let type_id = req.params['id'];
        console.log(req.params['id']);
        let sql = `SELECT arrangementer.* , 
    sale.navn AS 'sal',
    type.navn AS 'type' 
    FROM(( arrangementer INNER JOIN sale ON Sal_fk = sale.id) 
    INNER JOIN type ON type_fk = type.id) 
    WHERE type.id =  ${req.params['id']}`;
        if (type_id == 0) {
            db.query("SELECT arrangementer.* , sale.navn AS 'sal', type.navn AS 'type' FROM(( arrangementer INNER JOIN sale ON Sal_fk = sale.id) INNER JOIN type ON type_fk = type.id)", (error, rows) => {
                res.json(rows);
            });
        } else {
            db.query(sql, (error, rows) => {
                res.json(rows);

            });
        }
    });

    // ================================================================

    // Opretter arrangementer
    app.post('/opret', function (req, res) {
        console.log(req.body);
        db.query(`INSERT INTO sale SET navn = '${req.body.sal}', pladser  = '${req.body.pladser}', type_fk  = '${req.body.type}'`,
            function (error) {
                if (error) {
                    console.log(error)
                }
                else {
                    db.query('SELECT * FROM sale ORDER BY id DESC LIMIT 1', function (err, data_seneste_sal) {
                        console.log(data_seneste_sal);
                        if (err) {
                            console.log(err);
                        } else {
                            db.query(`INSERT INTO arrangementer SET navn = '${req.body.navn}', pris = '${req.body.pris}', Sal_fk = '${data_seneste_sal[0].id}', varighed= '${req.body.varighed}' , beskrivelse = '${req.body.beskrivelse}'`,
                                function () {

                                });
                        }
                    })
                }
            });
    });

    // ================================================================

    // Sletter arrangementer
    app.get('/slet/:id', function (req, res) {
        db.query(`DELETE FROM arrangementer WHERE id = ${req.params.id}`, (error, rows) => {
            res.json(rows);
        });
    });



};