<html>
<head>
<meta http-equiv="refresh" content="4; url=<?php echo $_SERVER['SCRIPT_NAME'];  ?>" > 
<style>
	.demo {
		border:1px solid #C0C0C0;
		border-collapse:collapse;
		padding:5px;
		align="center";
	}
	.demo th {
		border:1px solid #C0C0C0;
		padding:5px;
		background:#F0F0F0;
	}
	.demo td {
		border:1px solid #C0C0C0;
		padding:5px;
	}
</style>
</head>
<body>
<table class="demo" align="center">
	<caption><b>PPC IP MONITOR </b><?php echo "<a href=".$_SERVER['SCRIPT_NAME'].'?action=reset'.">(RESET)</a>";?></caption>
	
	<thead>
	<tr>
		<th>TIME (EST)</th>
		<th>TIME (PST)</th>
		<th>Landing Page</th>
		<th>IP</th>
		<th>IP SCORE</th>
		<th>CLICKS</th>
		<th>BAD IP</th>
		<th>MULTIPLE CLICKS</th>
	</tr>
	</thead>
	<tbody>
	
	<?php	
		//at a later point, you can convert it back to array like
		$filename = 'file_name.dat';
		
		if (!empty($_GET['action']) && $_GET['action'] == 'reset') {
			unlink($filename);
			
		}
		
		$recoveredDat = file_get_contents($filename);
		$recoveredArra = unserialize($recoveredDat);
		$arr = array();
		
		foreach($recoveredArra  as $value) {
			echo "<tr>";
			echo "<td>".$value['est']."</td>";
			echo "<td>".$value['pst']."</td>";
			echo "<td>".$value['lp']."</td>";
			echo "<td>".$value['ip']."</td>";
			echo "<td>".$value['ipscore']."</td>";
			echo "<td>".++$arr[$value['ip']]."</td>";
			$ipscore = $value['ipscore'];
			$clicks = $arr[$value['ip']];
			
			if ($ipscore >= 0.7)
				echo "<td>YES</td>";
			else{
				echo "<td>NO</td>";
			}
			
			if ($clicks > 1)
				echo "<td>YES</td>";
			else{
				echo "<td>NO</td>";
			}
			
			
			echo "</tr>";
		}
		
	?>
	
	
	
	</tbody>
</table>
            
</body>
</html>
