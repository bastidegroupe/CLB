<h1>Extranet {$element.lb_donneur_ordre}</h1>

<form name="recherche" class="form l150" method="post" action="/clients_had/liste">
	<fieldset class="bloc_recherche">
		<legend>Recherche client HAD</legend>
		
		<div class="gauche">
			<ol>
				<li><label>Numéro de client</label> <input type="text" value="{$r_clients_had.r_sk_client}" name="r_sk_client"  style="width:100px"/></li>
				<li><label>Nom du client</label> <input type="text" value="{$r_clients_had.r_lb_donneur_ordre}" name="r_lb_donneur_ordre" /></li>	
				
			</ol>
		</div>
				
		<div class="droite">
			<ol>
				<li><label>Statut </label> <select name="r_statut" style="width: 150px;">
					<option value="T" {if $r_clients_had.r_statut EQ "T"}selected{/if}>- Tous -</option>
					<option value="A" {if $r_clients_had.r_statut EQ "A"}selected{/if}>En cours</option>
					<option value="D" {if $r_clients_had.r_statut EQ "D"}selected{/if}>Supprimés</option>
				</select></li>			
			</ol>
		</div>		
		<div class="separe h_20"></div>		
		<input name="btn_recherche" class="boutton" type="submit" value="RECHERCHER"> 
		<input name="btn_ajouter" style="float: right" class="boutton" type="button" value="AJOUTER" onclick="window.location='/clients_had/ajouter'">		
	</fieldset>

	<table id="tableau_resultat" class="display" style="color: black;">
		<thead>
			<tr>
				<th>N°</th>
				<th>Donneur d'ordre</th>
				<th>Ville</th>
				<th>Téléphone</th>
				<th>Statut</th>				
				<th></th>
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
                  exclude: [0, 5, 6]
                },
    "language": { "url": "/js/dataTables.french.lang" },
	"columns": [
	               {name:"sk_client"},
     			   {name:"lb_donneur_ordre"},
				   {name:"lb_ville"},
				   {name:"lb_telephone"},
				   {name:"statut" , "visible": true},
	               { "orderable": false },
	               { "orderable": false }
	             ],
     "ajax": "/clients_had/tableau_json",
     "serverSide": true,
   	 "stateSave":true       	 
});	

function activer(sk_client){
	//appel reactivation avec confirmation
	  confirm_url_ajax('Voulez-vous vraiment réactiver le client HAD '+sk_client+'?',
			  '/clients_had/activer/'+sk_client,'#tableau_resultat');
	} 
	          
function desactiver(sk_client){
	//appel désactivation avec confirmation
	  confirm_url_ajax('Voulez-vous vraiment supprimer le client HAD '+sk_client+'?',
			  '/clients_had/desactiver/'+sk_client,'#tableau_resultat');  		 
	}
	
</script>
{/literal}