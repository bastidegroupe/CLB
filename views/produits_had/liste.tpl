<h1>Extranet {$element.lb_donneur_ordre}</h1>

<form name="recherche" class="form l150" method="post" action="/produits_had/liste">
	<fieldset class="bloc_recherche">
		<legend>Recherche produit HAD</legend>
		
		<div class="gauche">
			<ol>
				<li><label>Code produit</label> <input type="text" value="{$r_produits_had.r_sk_produit}" name="r_sk_produit"  style="width:100px"/></li>
				<li><label>Libellé produit</label> <input type="text" value="{$r_produits_had.r_lb_produit}" name="r_lb_produit" /></li>	
				
			</ol>
		</div>
				
		<div class="droite">
			<ol>
				<li><label>Statut </label> <select name="r_statut" style="width: 150px;">
					<option value="T" {if $r_produits_had.r_statut EQ "T"}selected{/if}>- Tous -</option>
					<option value="A" {if $r_produits_had.r_statut EQ "A"}selected{/if}>Actifs</option>
					<option value="D" {if $r_produits_had.r_statut EQ "D"}selected{/if}>Inactifs</option>
				</select></li>			
			</ol>
		</div>		
		<div class="separe h_20"></div>		
				<input name="btn_recherche" class="boutton" type="submit" value="RECHERCHER"> 
	</fieldset>

	<table id="tableau_resultat" class="display" style="color: black;">
		<thead>
			<tr>
				<th>Code</th>
				<th>Libellé</th>
				<th>Groupe</th>
				<th>Libellé</th>
				<th>Statut</th>				
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
                  exclude: [0, 5, 6, 7  ]
                },
    "language": { "url": "/js/dataTables.french.lang" },
	"columns": [
	               {name:"sk_produit"},
     			   {name:"lb_produit"},
				   {name:"sk_groupe_marchandise"},
				   {name:"lb_hierachie"},
				   {name:"statut" , "visible": true},
	               { "orderable": false }
	             ],
     "ajax": "/produits_had/tableau_json",
     "serverSide": true,
   	 "stateSave":true       	 
});	

function activer(sk_produit){
	//appel reactivation avec confirmation
	  confirm_url_ajax('Voulez-vous vraiment réactiver le produit HAD '+sk_produit+'?',
			  '/produits_had/activer/'+sk_produit,'#tableau_resultat');
	} 
	          
function desactiver(sk_produit){
	//appel désactivation avec confirmation
	  confirm_url_ajax('Voulez-vous vraiment désactiver le produit HAD '+sk_produit+'?',
			  '/produits_had/desactiver/'+sk_produit,'#tableau_resultat');  		 
	}
	
</script>
{/literal}