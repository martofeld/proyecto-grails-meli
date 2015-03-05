<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Organizador de regalos</title>
</head>
<body>
	<script>
		function regalar(id) {
			window.location = "/proyecto-grails-meli/usuarios/regalar/"
					+ id
		}
	</script>
	<br>
	<div align="center">
		<h3>
			<g:message code="¡Bienvenid@! Hoy cumplen..." />
		</h3>
	</div>
	<br>
	<div align="center">
		<table border="1">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Regalo</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${regalosDeHoy}" var="unRegalo">
					<tr onclick="regalar(${unRegalo.id})">
						<td>
							${unRegalo.usuario.nombre}
						</td>
						<td>
							${unRegalo.usuario.apellido}
						</td>
						<td>
							${unRegalo.url}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
	<br>
	<g:form controller="usuarios">
		<div align="center">
			<g:actionSubmit class="btn" controller="usuarios"
				action="crearUsuario" value="Crear Usuario" />
			<g:actionSubmit class="btn" controller="usuarios"
				action="verUsuarios" value="Ver Usuario" />
		</div>
	</g:form>
	<br>
</body>
</html>