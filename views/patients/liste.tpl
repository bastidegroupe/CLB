<h1>Extranet {$element.lb_donneur_ordre}</h1>

<form name="recherche" class="form l150" method="post" action="/patients/liste" style="height:500px">
	<fieldset class="bloc_recherche">
		<legend>Recherche par patient</legend>
		
		<h4>Vous pouvez rechercher un patient pour gérer ou créer un bon de commande</h4>		
		
		<div class="gauche">
			<ol>
				<li><label>Numéro de patient</label> <input type="text" value="{$r_patients.r_ext_patient}" name="r_ext_patient"  style="width:100px"/></li>
				<li><label>Nom du patient</label> <input type="text" value="{$r_patients.r_lb_nom}" name="r_lb_nom" /></li>	
				<li><label>Date de naissance</label> <input type="text" class="date" value="{$r_patients.r_dt_naissance}" name="r_dt_naissance" /></li>
				<div class="separe h_20"></div>			
			</ol>
		</div>
				
		<div class="droite">
			<ol>
				<li><label>Statut </label> <select name="r_statut" style="width: 150px;">
						<option value="T" {if $r_patients.r_statut EQ "T"}selected{/if}>- Tous -</option>
						<option value="A" {if $r_patients.r_statut EQ "A"}selected{/if}>En cours</option>
						<option value="D" {if $r_patients.r_statut EQ "D"}selected{/if}>Supprimés</option>
				</select></li>
			</ol>
		</div>
		<div class="separe h_5"></div>		
		<div>
			<input name="btn_recherche" class="boutton left" type="submit" value="RECHERCHER"> 
			<input name="btn_ajouter" style="float: right" class="boutton right" type="button" value="AJOUTER" onclick="window.location='/patients/ajouter'">	
		</div>
	</fieldset>

	<table id="tableau_resultat" class="display" style="color: black;">
		<thead>
			<tr>
				<th>N°</th>
				<th>Titre</th>
				<th>Nom</th>
				<th>Date naissance</th>
				<th>Ville</th>
				<th>Code postal</th>
				<th>statut</th>
				<th></th>
			</tr>
		</thead>
	</table>

	</form>
	{literal}
<script type="text/javascript">
var table = $('#tableau_resultat').dataTable( {
    "autoWidth" : true,
    "processing": true,
    "scrollX": "100%",
    "scrollY": "400px",
	"scrollCollapse": true,
 	"dom": 'C<"clear">RtiS',
    "deferRender":true,
    "scroller": {
    	"loadingIndicator": true
	},
	"colReorder": {
		"fixedColumns": 1 ,      //colonnes non deplacables a droite
		"fixedColumnsRight": 3  //colonnes non deplacables a droite
	},
	"colVis": {
		exclude: [0, 7]
	},
    "language": { "url": "/js/dataTables.french.lang" },
	"columns": [
	   {name:"ext_patient"},
	   {name:"lb_titre"},
	   {name:"lb_nom"},
	   {name:"dt_naissance"},
	   {name:"lb_ville"},
	   {name:"lb_codepostal"},
	   {name:"statut"},
	   {"orderable": false}
	],
	"ajax": "/patients/tableau_json",
	"serverSide": true
});	
	
function activer(ext_patient){
	//appel suppression avec confirmation
	confirm_url_ajax('Voulez-vous vraiment réactiver ce patient '+ext_patient+' ?',
				     '/patients/activer/'+ext_patient,'#tableau_resultat');
				 }
function desactiver(ext_patient){
	//appel suppression avec confirmation
	confirm_url_ajax('Voulez-vous vraiment supprimer ce patient '+ext_patient+' ?',
					 '/patients/desactiver/'+ext_patient,'#tableau_resultat');
			 
	}      
function gerer(ext_patient){
//appel fonction editer	   
	   window.location.href='/patients/gerer/'+ext_patient;
}
</script>
{/literal}