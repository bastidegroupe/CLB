{assign var='message' value=$message|default:' '}
<form name="editer" class="form" method="post" action="/mails/enregistrer">
    <!-- onSubmit="verifform();" -->
    <input type="hidden" name="hide_id" value="{$element.hide_id}" />
    <input type="hidden" name="credat" value="{$element.credat}" />
    <input type="hidden" name="creheu" value="{$element.creheu}" />
	<ol>
		<li>
			<label>Id mail :</label> <input class="code" type="text" name="id" value="{$element.id}" readonly  />
			<label style="width:auto">&nbsp;Date :&nbsp;</label> <input  style="width:80px" type="text" value="{$element.credat|dat}" readonly  />
			<label style="width:auto">&nbsp;Heure :&nbsp;</label> <input  style="width:80px" type="text" value="{$element.creheu|truncate:8:""}" readonly  />	
		</li>
		<li><label>Expediteur </label> <input style="width:700px" type="text" name="mailfrom" value="{$element.mailfrom}"  {if $element.hide_id}readonly{/if} /></li>
		<li><label>Destinataire</label> <input style="width:700px" type="text" name="mailto"  value="{$element.mailto}"  {if $element.hide_id}readonly{/if} /></li>
		<li><label>Sujet :</label> <input style="width:700px" type="text" name="subject" value="{$element.subject}" {if $element.hide_id}readonly{/if} /></li>
		<br />
	</ol>
	<div class="separe"></div>
	<div style="z-index:9999">
		<textarea class="ckeditor" style = "width : 100%; height : 550px; " id="body" name="body">{$element.body} </textarea>
	</div>
	<div class="separe"></div>
	{if $element.hide_id}
	<ol>
		<li><label>Erreur(s) d'envoi</label> <input type="text" name="mailerror"  value="{$element.mailerror}" readonly /></li>
	</ol>
	{/if}
	<br /> <br />
	<input name="btn_annuler" type="button" onclick="window.location.href = '/mails'" class="boutton" value="FERMER"  />
	<input name="btn_envoyer"  type="submit" class="boutton right" value="{if $element.hide_id}R{/if}ENVOYER"/>
</form>

<script src="/js/ckeditor/ckeditor.js"></script>
<script>
	CKEDITOR.config.height = 300;
	{if $element.hide_id}
	CKEDITOR.config.readOnly=true;
	{/if}
	{literal}
		$("input[name='mailto']").autocomplete(
				{source: '/mails/autocomplete',
					minLength: 2
				}
		);
		
	{/literal}
</script>
