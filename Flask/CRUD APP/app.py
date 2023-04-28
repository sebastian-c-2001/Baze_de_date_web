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

#app_bp = Blueprint('app', __name__)



@app.route('/')
def Index():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM autori")
    data = cur.fetchall()
    cur.close()

    return render_template('autori_web.html', autori = data)


@app.route('/insert', methods = ['POST'])
def insert():
    if request.method == "POST":
        flash("Autor adaugat cu succes!")
        nume = request.form['nume']
        prenume = request.form['prenume']
        adresa = request.form['adresa']
        varsta = request.form['varsta']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO autori (nume, prenume, adresa,varsta) VALUES (%s, %s, %s, %s)", (nume, prenume, adresa,varsta))
        mysql.connection.commit()
        return redirect(url_for('Index'))


@app.route('/delete/<string:id_data>', methods = ['GET'])
def delete(id_data):
        flash("Autor sters!")
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM autori WHERE idautori=%s", (id_data,))
        mysql.connection.commit()
        return redirect(url_for('Index'))


@app.route('/update', methods = ['POST', 'GET'])
def update():
    if request.method == 'POST':
        idautori = request.form['idautori']
        nume = request.form['nume']
        prenume = request.form['prenume']
        adresa = request.form['adresa']
        varsta = request.form['varsta']
        cur = mysql.connection.cursor()
        cur.execute("""UPDATE autori SET nume=%s, prenume=%s, adresa=%s, varsta=%s WHERE idautori=%s """, (nume, prenume, adresa,varsta,idautori))
        mysql.connection.commit()
        flash("Date actualizate.")
        return redirect(url_for('Index'))

if __name__ == "__main__":
    app.run(debug=True)