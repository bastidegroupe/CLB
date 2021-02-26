{assign var='tabactif' value=$tabactif|default:0}
{assign var='zoneerr' value=$zoneerr|default:'*'}

<form name="editer" id="editer" method="post" action="/clients_had/enregistrer">

	<!-- onSubmit="verifform();" -->
	<input type="hidden" name="hide_sk_client" value="{$client.hide_sk_client}" />

	<div id="tabs" class="form" style="height: 600px" >
		<ul id="enttabs" hidden>
			<li><a href="#tabs-1">Client HAD </a></li>
		</ul>
		
		<div id="tabs-1">		
				<ol>
					<li><label>N°</label> <input type="text" name="sk_client" style="width: 100px" maxlength="10" value="{$client.sk_client}" /></li>
					<li><label>Nom</label> <input type="text" name="lb_donneur_ordre"  style="width: 500px" maxlength="35" value="{$client.lb_donneur_ordre}" /></li>
					<li><label>Adresse</label> <input type="text" name="lb_adresse" style="width: 500px" maxlength="60" value="{$client.lb_adresse}" /></li>
					<li><label>Code postal/Ville</label> <input type="text" id="lb_cd_postal" name="lb_cd_postal"  style="width: 50px" maxlength="5" class="code" value="{$client.lb_cd_postal}" />
						<input type="text" id="lb_ville" name="lb_ville" maxlength="38" style="width: 207px" value="{$client.lb_ville}" /></li>
					<li><label>Téléphone</label> <input type="text" name="lb_telephone" maxlength="20" value="{$client.lb_telephone}" /></li>
					<li><label>Fax</label> <input type="text" name="lb_fax" maxlength="20" value="{$client.lb_fax}" /></li>
					<li><label>Mail</label> <input type="text" name="lb_mail_cial" maxlength="35" value="{$client.lb_mail_cial}" /></li>
					<li><label>Télécopie</label> <input type="text" name="lb_telecopie" maxlength="30" value="{$client.lb_telecopie}" /></li>
					<li><label>Préfixe de numérotation</label> <input type="text" name="prefixe_num" class="code" maxlength="3" value="{$client.prefixe_num}" /></li>
					<li><label>Mail du gestionnaire 1 Bastide</label> <input type="text" name="lb_mail_gest1" maxlength="200" value="{$client.lb_mail_gest1}" /></li>
					<li><label>Mail du gestionnaire 2 Bastide </label> <input type="text" name="lb_mail_gest2" maxlength="200" value="{$client.lb_mail_gest2}" /></li>
					<li><label>Mail du gestionnaire évènement Bastide</label> <input type="text" name="lb_mail_eve" maxlength="35" value="{$client.lb_mail_eve}" /></li>
				</ol>
			<div class="separe h_20"></div>
		</div>
	</div>
	<input name="btn_enregistrer" id="btn_gen_enregistrer" type="submit" class="boutton right"  value="ENREGISTRER" />
	<input name="btn_annuler"     id="btn_gen_annuler"     type="submit" class="boutton left" value="FERMER" /> 

</div>	
</form>

{literal}
<script>
//=================================================================
// ONGLET + erreur
//=================================================================
	var tab = $('#tabs').tabs({
		heightStyle: "fill",
				active: {/literal}{$tabactif}{literal},

		activate: function (event, ui) {
				$('#tabactif').val(tab.tabs("option", "active"));
						$('#btn_gen_enregistrer').show();
						$('#btn_gen_annuler').show();
				}
		});
				$('#enttabs').show();
				zoneerr = '{/literal}{$zoneerr}{literal}';
				if (zoneerr != '') {
				$('input[name="' + zoneerr + '"]').css("border", "solid 2px red");
				$('input[name="' + zoneerr + '"]').focus();
				$('select[name="' + zoneerr + '"]').css("border", "solid 2px red");
				$('select[name="' + zoneerr + '"]').focus();
		}

</script>
{/literal}
