if [ -z "$A" ] || [ -z "$B" ]; then
	echo "A and B environment variables not set"
	exit 1
fi

sum=$((A + B))

echo "the sum of $A and $B is $sum"
