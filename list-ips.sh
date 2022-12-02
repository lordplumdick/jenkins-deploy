aws ec2 describe-instances \
  --filters "Name=tag-key,Values=aws-site" "Name=instance-state-name,Values=running" \
    --query 'Reservations[*].Instances[*].{Instance:PublicIpAddress}' \
    --output json