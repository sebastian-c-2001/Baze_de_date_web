from flask import Flask, render_template, request, url_for, flash
from flask_mysqldb import MySQL
from werkzeug.utils import redirect
from flask import Blueprint

app =Flask(__name__)
app.secret_key = 'many random bytes'
app.config['MYSQL_HOST']= 'localhost'
app.config['MYSQL_USER']= 'root'
app.config['MYSQL_PASSWORD']= '123456'
app.config['MYSQL_DB']= 'tema_3'

mysql= MySQL(app)



@app.route('/')
def Index():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM proiecte")
    data = cur.fetchall()
    cur.close()

    return render_template('proiecte_web.html', proiecte = data)


@app.route('/insert', methods = ['POST'])
def insert():
    if request.method == "POST":
        flash("Proiect postat cu succes!")
        denumire = request.form['denumire']
        tematica = request.form['tematica']
        termen_limita = request.form['termen_limita']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO proiecte (denumire, tematica, termen_limita) VALUES (%s, %s, %s)", (denumire, tematica, termen_limita))
        mysql.connection.commit()
        return redirect(url_for('Index'))


@app.route('/delete/<string:id_data>', methods = ['GET'])
def delete(id_data):
        flash("Proiect sters!")
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM proiecte WHERE idproiecte=%s", (id_data,))
        mysql.connection.commit()
        return redirect(url_for('Index'))


@app.route('/update', methods = ['POST', 'GET'])
def update():
    if request.method == 'POST':
        idproiecte = request.form['idproiecte']
        denumire = request.form['denumire']
        tematica = request.form['tematica']
        termen_limita = request.form['termen_limita']
        cur = mysql.connection.cursor()
        cur.execute("""UPDATE proiecte SET denumire=%s, tematica=%s, termen_limita=%s WHERE idproiecte=%s """, (denumire, tematica, termen_limita,idproiecte))
        mysql.connection.commit()
        flash("Date actualizate.")
        return redirect(url_for('Index'))

if __name__ == "__main__":
    app.run(debug=True)