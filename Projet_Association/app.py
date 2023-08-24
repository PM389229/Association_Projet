from flask import Flask, render_template, request, redirect, url_for
from database import Database

app = Flask(__name__)

# Configuration de la base de données MySQL
db = Database()

# Montant de l'objectif à atteindre (en euros)
objectif_recolte = 300000

@app.route('/')
def index():
    # Récupération des 5 derniers donateurs depuis la base de données MySQL
    recent_donations = db.get_recent_donations(5)
    
    # Calcul du montant total récolté jusqu'à présent
    total_recolte = db.get_total_recolte()

    # Vous pouvez personnaliser le titre et la description ici
    return render_template('index.html', recent_donations=recent_donations, total_recolte=total_recolte)

@app.route('/donation_form', methods=['GET', 'POST'])
def donation_form():
    if request.method == 'POST':
        nom = request.form['nom']
        prenom = request.form['prenom']
        adresse = request.form['adresse']
        email = request.form['email']
        somme_promise = request.form['somme_promise']
        conditions = True if 'conditions' in request.form else False

        # Enregistrement des données dans la base de données MySQL en utilisant la méthode insert_donation de la classe Database
        db.insert_donation(nom, prenom, adresse, email, somme_promise, conditions)

        return redirect(url_for('thank_you'))

    return render_template('donation_form.html')

@app.route('/donation_list')
def donation_list():
    # Récupération de toutes les promesses de don depuis la base de données MySQL en utilisant la méthode get_donations de la classe Database
    donations = db.get_donations()

    # Calcul du total récolté en utilisant la méthode get_total_recolte de la classe Database
    total_recolte = db.get_total_recolte()

    return render_template('donation_list.html', donations=donations, total_recolte=total_recolte)

@app.route('/thank_you')
def thank_you():
    return render_template('thank_you.html')

# Route pour afficher la liste des derniers donateurs
@app.route('/recent_donations')
def recent_donations():
    # Récupération des derniers donateurs depuis la base de données MySQL en utilisant la méthode get_recent_donations de la classe Database
    recent_donors = db.get_recent_donations(10)  # Vous pouvez modifier le nombre de donateurs affichés ici

    return render_template('recent_donations.html', recent_donors=recent_donors)

if __name__ == '__main__':
    app.run(debug=True)