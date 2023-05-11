# Task: Deploying a Static Web Application using S3 and Cloudfront

## Steps:

1. Create a S3 bucket and give it a unique name
2. During creating, ensure you enable the public access to the bucket objects via the S3 object URL. 
3. Secure the bucket by editting the bucket policy to allow api calls to "Getobject" in the bucket 
Read more via: https://docs.aws.amazon.com/AmazonS3/latest/userguide/add-bucket-policy.html
4. Upload the files in the static website folder to your bucket. NB: Do not upload the folder. Remember, you can play with the static website index html.
5. Configure  the bucket properties to allow for static website hosting
6. Copy the arn generated and keep to use in the cloudfront ditribution creation
7. Test the arn if it is working (You should see your static webpage)
8. Create a cloudfront distribution using the arn you copied. Guide : https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/GettingStarted.SimpleDistribution.html
9. Use the cloudfront DNS to check if your static webpage has been successfully deployed.
10. When done, get the following screenshort
    i. The S3 arn showing your webpage is deployed
    ii. The Cloudfront DNS showing your webpage
    iii. A screenshoot of successful upload of files to s3 bucket
11. Created a folder in your capstone project 1, name it, "images,". Upload your screenshots and push to your git repo. 
12. Perform clean up operations.

Good Luck!