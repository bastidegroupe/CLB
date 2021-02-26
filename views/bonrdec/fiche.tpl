<h1>Extranet {$client_had.lb_donneur_ordre}</h1>

<form name="editer" method="post" action="/bonrdec/enregistrer">
	
	<input type="hidden" name="hide_numbrdec" value="{$element.hide_numbrdec}" />
	<input type="hidden" name="numbrdec" value="{$element.numbrdec}" />
	
	<div id="tabs" class="form" style="height:700px">
		<ul>
			<li><a href="#tabs-1">Bon de récupération déchet N° {$element.numbrdec}</a></li>			
		</ul>

		<div id="tabs-1" class="form_editer">
			<div  > 
				<fieldset>
					<ol>	
						<li>
							<label style="width:125px">Demande le</label> <input type="text" name="datdem" id="datdem" class="date" maxlength="50" value="{$element.datdem}" />
							<label style="margin-left:210px; width:150px">Nom demandeur</label><input type="text" style="width:300px" name="nomdem" id="nomdem"  value="{$element.nomdem}" readonly />
						</li>
						<div class="h_5 separe"></div>						
						<fieldset>
							<legend> Demande de récupération de déchet</legend>
								<li>
									<input type="checkbox" name="r_dechet" id="r_dechet" {if $element.r_dechet EQ "O"} checked {/if} />  <label style="width:100px" >Déchets</label> 
									<input type="checkbox" name="r_conso" id="r_conso" {if $element.r_conso EQ "O"} checked {/if} /> <label style="width:130px" >Consommables</label> 
									<input type="checkbox" name="r_medic" id="r_medic" {if $element.r_medic EQ "O"} checked {/if} /> <label style="width:170px" >Médicaments</label> 
								</li>
						</fieldset>
						<div class="h_5 separe"></div>
						<label style="width:125px">A effectuer le</label> <input type="text" name="datrec" id="datrec" class="date" maxlength="50" value="{$element.datrec}" />
							<input type="radio" style="margin-left:75px" name="jrsrec" id="jrsrec1" value="AM" {if $element.jrsrec EQ "AM"} checked {/if}><label for="jrsrec1" style="width:auto;">Matin &nbsp;</label>
							<input type="radio" style="margin-left:10px" name="jrsrec" id="jrsrec2" value="PM" {if $element.jrsrec EQ "PM"} checked {/if}><label for="jrsrec2" style="width:auto;">Après-Midi &nbsp;</label>							
							<input type="radio" style="margin-left:10px" name="jrsrec" id="jrsrec3" value="DJ" {if $element.jrsrec EQ "DJ"} checked {/if}><label for="jrsrec3" style="width:auto;">Dans la journée &nbsp;</label>							
						</li>
						<div class="h_5 separe"></div>	
						<fieldset>
							<legend> Patient n° {$patient_had.ext_patient} - né le {$patient_had.dt_naissance} </legend>
							<div class="gauche" style="width:450px" > 
								<li>
									<input  type="hidden" class="mot" name="numpat" id="numpat" value="{$element.numpat}"/>
									<label style="width:120px">Nom/prénom</label><input  type="text" style="width:290px;" id="patient_lb_nom"  value="{$patient_had.lb_nom}"    readonly tabindex="-1"/>
								</li>
								<li>
									<label style="width:120px">Adresse</label><input  type="text" style="width:290px;" id="patient_lb_adresse"  value="{$patient_had.lb_adresse}"    readonly tabindex="-1"/>
								</li>
								<li>
									<label style="width:120px">Code postal/ville</label><input  type="text"style="width:50px;"  id="patient_lb_codepostal"  value="{$patient_had.lb_codepostal}"    readonly tabindex="-1"/>
									<input  type="text" style="width:180px;" id="patient_lb_ville"  value="{$patient_had.lb_ville}"    readonly tabindex="-1"/>
								</li>
							</div>
							
							<div class="droite" style="width:420px" > 
								<fieldset style="height:120px;">
									<legend>Autres coordonnées</legend>	
									<li> <textarea name="lierecaut" id="lierecaut" maxlength="500" style="height:90px; width:400px" >{$element.lierecaut}</textarea></li>	
								</fieldset>
							</div>
							
							<!-- <li>
								<input type="radio" name="r_maison" id="r_maison1" value="O" {if $element.r_maison EQ "O"} checked {/if}><label for="r_maison1" style="width:auto;">Maison &nbsp;</label>
								<input type="radio" name="r_maison" id="r_maison2" value="N" {if $element.r_maison EQ "N"} checked {/if}><label for="r_maison2" style="width:auto;">Appartement &nbsp;</label>

								<input  style="margin-left:50px;" type="radio" name="r_rdc" id="r_rdc1" value="O" {if $element.r_rdc EQ "O"} checked {/if}><label for="r_rdc1" style="width:auto;">RDC &nbsp;</label>
								<input type="radio" name="r_rdc" id="r_rdc2" value="N" {if $element.r_rdc EQ "N"} checked {/if}><label for="r_rdc2" style="width:auto;">Etage &nbsp;</label>

								<label style="margin-left:250px; width:105px">Ascenseur</label>
								<input type="radio" name="r_ascen" id="r_ascen1" value="O" {if $element.r_ascen EQ "O"} checked {/if}><label for="r_ascen1" style="width:auto;">Oui &nbsp;</label>
								<input type="radio" name="r_ascen" id="r_ascen2" value="N" {if $element.r_ascen EQ "N"} checked {/if}><label for="r_ascen2" style="width:auto;">Non &nbsp;</label>
							</li>-->
						</fieldset>
						<div class="h_5 separe"></div>						
						<fieldset style="height:250px;">
							<legend>Commentaires</legend>
								<div class="gauche" style="width:420px" > 
									<li> <label>Divers</label></li>
									<li> <textarea name="com_div" id="com_div" maxlength="500" style="height:180px; width:410px" >{$element.com_div}</textarea></li>	
								</div>
									<div class="droite" style="width:420px" > 	
									<li> <label>Interne</label></li>
									<li> <textarea name="com_int" id="com_int" maxlength="500" style="height:180px; width:410px" >{$element.com_int}</textarea></li>	
								</div>		
						</fieldset>
						<div class="h_5 separe"></div>
					</ol>
				</fieldset>
			</div>
			<div class="h_5 separe"></div>
		</div>
	
		<div class="h_20 separe"></div>
		
	
	</div>
	<input name="btn_enregistrer"  type="submit" class="boutton right" value="ENREGISTRER" />
	<input name="btn_annuler" type="submit" class="boutton left"  value="FERMER"  />
	<div class="h_20 separe"></div>

</form>
{literal}
	<script>
		$('#tabs').tabs({heightStyle: "auto", 
		});	
	</script>
{/literal}
