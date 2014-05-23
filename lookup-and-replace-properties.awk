# replace mobile propery value with pc property value
# use when mobile property keys are "M[\._]" + pc property keys
# property definition for pc should be placed before mobile definition
BEGIN { FS="="}
{
	# if a property has value
	if (NF >= 2) {
	
		# for pc properties
		if (!match($1, /^M[\._]/)) {
			if (NF == 2) {
				value = $2
			} else {
				value = "";
				for (i=2; i<=NF; i++) {
					if (i != 2) {
						value = value "=";
					}
					value = value $i;
				}
			}
			lookup[$1] = value;
			print $1 "=" value;

		# for mobile properties (starts with "M." or "M_")  
		} else if (match($1, /^M[\._]/)) {
			key = gensub(/^M[\._]/, "", "", $1);		
			# if has pc value use pc value
			if (lookup[key]) {
				value = lookup[key];	
				print $1 "=" value;
			} else {
				print $0;
			}
		} else {
			print $0;
		}
	# if a property has no value or is comment then no changes
	} else {
		print $0;
	}
}
