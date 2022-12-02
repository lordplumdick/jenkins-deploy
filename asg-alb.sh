lb_arn=$(aws elbv2 create-load-balancer --name aws-site-lb  --subnets subnet-0aaceda33524c5c3c subnet-0b11d6c9ece478969 --security-groups sg-0ce2072c8e82bd687  --query ['LoadBalancers'][0][0].'LoadBalancerArn' --output text)
tg_arn=$(aws elbv2 create-target-group --name aws-site-targets --protocol HTTP --port 80 --vpc-id  vpc-fc12ed9a --query ['TargetGroups'][0][0].TargetGroupArn --output text)
#aws elbv2 register-targets --target-group-arn $tg_arn --targets Id=i-02dda62bb21172c94
aws elbv2 create-listener --load-balancer-arn $lb_arn --protocol HTTP --port 80 --default-actions Type=forward,TargetGroupArn=$tg_arn
aws autoscaling create-launch-configuration --launch-configuration-name aws-site-lc --key-name kp1-us-east-1 --image-id ami-09d95fab7fff3776c --security-groups sg-51110120 --instance-type t2.micro --user-data file://userdata-code-deploy-agent.txt --iam-instance-profile arn:aws:iam::442816435602:instance-profile/EC2CodeDeploy
aws autoscaling create-auto-scaling-group --auto-scaling-group-name aws-site-asg --launch-configuration-name aws-site-lc --tags Key=Name,Value=aws-site,PropagateAtLaunch=true  Key=aws-site,Value=aws-site,PropagateAtLaunch=true --min-size 1 --max-size 3 --vpc-zone-identifier "subnet-0aaceda33524c5c3c,subnet-0b11d6c9ece478969" --tags Key=aws-site,Value=aws-site,PropagateAtLaunch=true
aws autoscaling attach-load-balancer-target-groups --auto-scaling-group-name aws-site-asg --target-group-arns $tg_arn
aws elbv2 describe-load-balancers --load-balancer-arns $lb_arn --query ['LoadBalancers'][0][0].DNSName --output text
