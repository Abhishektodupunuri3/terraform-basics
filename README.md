# terraform-basics
# terraform-basics

In this repository, we are going to place all the needed bascis that are needed to kick start our Terraform Provisioning Capabilites.

Most of the information in terraform should be referred from `terraform registry only` : 

```
    https://registry.terraform.io/?
```

Important Terminology In Terraform 

```
    1) Arguments     : Properties of the resource as apart of the resource creation
    2) Attributes    : Properties of the resource which can be only after the resource creation.
    3) Providers
    4) Modules
```


# Common Terraform Commands 

```
    $ terraform init 
    $ terraform plan
    $ terraform apply -auto-approve 

```


If you want to supply any values of the variable from the command line. 
```

    $ terraform plan -var VARNAME=value
    $ terraform apply -auto-approve -var VARNAME=value

```

If you want to supply any values of the variable from the anyother file apart from terraform.tfvars, you need to explicity pass the varaible file name to be used . 
```

    $ terraform plan -var-file=dev.tfvars
    $ terraform apply -auto-approve -var-file=dev.tfvars

```


### precedence 

```
    When compared to the values of the variables declared in terraform.tfvars, command line variables will have higher precendence

    -var / -var-file   >  terraform.auto.tfvars  > terraformtfvars > shell variables
```


### Shell Based Variables :

```
    These are the variables with least priority and this can be supplied by shell using export.

        $ export TF_VAR_varName=value 
    
    This is how we can supply the shell based variables
```

### What exactly happens when you run `terraform plan`  ? 

```
    When you run a terraform plan,  terraform is going to check the CURRENT STATE OF THE INFRASTRUCTURE and then it validates with what's there in the code that you're suppling against the terraform state file.

    If there are any changes ( how it comes to know ? Becuase of the above validation) , then terraform shows that to you during plan output.

    If you wan to want those changes, then you need to a `terraform apply` , when you do a terraform apply, your state will also be updated

    Eventually, your manual changes will be wiped off.
```

### Terraform has created some infrasturcure and then you manually went and updated the changes of the INFRA using console. Now if you Terraform Apply with the same old code , what will happen ???

```
    For Terraform, whatever is there in the CODE and as per that PLAN will be generated and for terraform PLAN is the source of truth, which means when you do a `terraform apply` , all your manual changes will be wiped off.

    99% of the times, a good setup will ensure you as a user won't be having write access on the console.
    Only the IAM Role, which we use to configure JENKINS will only have right access.

```

### All the operations are supposed to go by terraform only, what all ?

```
    READ
    WRITE
    UPDATE
    DELETE
```


### If statefile is that much important, what will happen ?

```

STATEFILE is going to capture everything that was created by terrform and if you lost that, you lost all your changes or tracking made by terraform and it's very very crucial so you need to ensure you need to have quite strong strategy to save it and organize it.

```

### Where should I store my statefile ?

```
In a team based environment, you should never save your statefile locally and this is to ensure to collaborate in the team based
environment.

It's always recommened to save state on the top of available REMOTE BACKENDS
```

### What is a backend ?

```
Backend is a place, where we are going to save our statefile. It can also be local ( means state will be saved locally : Which is not a recommended solution)

Ref : https://developer.hashicorp.com/terraform/language/settings/backends/configuration
```

### Remote Backend :

```
Type of remote backend is 100% based on the type of selected Remote Backend.
```


### What all needs to be considered when dealing with REMOTE Statefiles on AWS S3 Bucket as a part of the security measure.

```
1) Ensure no one has the ability or capability to delete that S3 Bucket ( Object Storage Service on AWS )
2) Objection Versioning on S3 should be enabled to capture all the changes along with their versions ( Just like GIT )
3) Ensure encryption is enabled by your own KMS Key ( either symmeric or asymmetric )

```

### Backend :

```
The place where you're storing your information is referred as backend and there are 2 types of backends :
    1) Local 
    2) Remote ( Multiple Varieties Of Remote Backend are Offered and this is recommended appraoch)
```


### What is a Module In Terraform and why do we need Modules in Terraform ?

```
Module is like a folder with the groups of resources to be created.

```

**Advantages of Using Terraform Modules**
```
By using modules, you can significantly reduce the amount of code you need to write and maintain. Rather than repeating the same code, you can create a module and reference it multiple times, passing different parameters.
```

In organizations, 100% of the infra will be built using TERRAFORM Only and manual changes are 100% strictly not allowed.

## Challenges with modules.

```
    1) If we are using modules, sharing the outputs and referencing the created resource attirbutes accorss the modules is not a direct task
    2) Passing outputs from module to module is not a direct process.
    3) If you want to send the outputs of Module-A to Module-B, it will never be a direct processs. Module-A has to pass the output information to root-module and then root-module has to pass the information to to the Module-B
```


### Data Source: 

```
This helps in extracting the information of the already existing resources and using this we can fetch the information of any existing resource.
```

### Provisioners In Terraform 

```
Provisioners are used to execure actions on the local machine or on a remote machine in order to prepare servers or other infrastructure objects for service.

    1) Remote Provisioners
    2) Local Provisioners
    3) File Provisioners

```

***NOTE***
```
Provisioners are by default create-time, which means they will only be executed during the infra creation only and it's wont be run again.
We also have comething called destroy-time provisioners, which means they will only be executed during the infra destroy only

But using triggers, we can control when they can triggered.
```


***Points To Be Noted***

```
1) Provisioners can be placed within the resource or outside the resource as well.

2) If your provisioner runs inside the infra, in this case even if your provisioner fails because of any reason, terraform records this particular event as failure and marks it as tained.

3) When a resource is marked as tainted in terraform state file, this particular resource will be subjected to recreation when you do a  `terraform apply` in the next run.

4) If your provisioner runs outside the infra, in this case even if your provisioner fails because of any reason, terraform records this particular event as failure and marks it as tained against that particular provisioner only. In this case, your resource won't be subjected to failure.


PS : Provisioner can only run inside a resource, but we have some dummy resources like `NULL RESOURCR` to host these kind of activities.
```




In this training, we would be using the latest version of terraform `v1.5.2` ( 10/July/2023 )

Terraform supports more 3,339 cloud providers and this keep on growing and this is the major reason why manority of the companies prefer to create infrastucture using terraform.


Terraform is an open-source infrastructure as code software tool that enables you to safely and predictably create, change, and improve infrastructure. It codifies cloud APIs into declarative configuration files that can be managed with version control. 

Terraform can manage existing and infrastructure as code infrastructure.

Here are some of the benefits of using Terraform:

Reproducibility: Terraform's declarative configuration files make it easy to reproduce your infrastructure on demand. This is important for ensuring that your infrastructure is consistent and up-to-date.

Auditability: Terraform's state file tracks the changes that have been made to your infrastructure. This makes it easy to audit your infrastructure and track changes over time.

Cost-efficiency: Terraform can help you to optimize your infrastructure costs by automating the provisioning and decommissioning of resources.

Security: Terraform can help you to improve the security of your infrastructure by enforcing security policies and best practices.
Here are some of the use cases for Terraform:

Provisioning and managing cloud resources: Terraform can be used to provision and manage resources in a variety of cloud providers, including AWS, Azure, and GCP.

Automating infrastructure deployments: Terraform can be used to automate the deployment of infrastructure, such as web servers, databases, and applications.

Orchestrating infrastructure changes: Terraform can be used to orchestrate changes to infrastructure, such as scaling up or down resources.

Managing multi-cloud infrastructure: Terraform can be used to manage infrastructure across multiple cloud providers.

Overall, Terraform is a powerful tool that can help you to manage your infrastructure more effectively and efficiently. If you are looking for a way to improve the reproducibility, auditability, cost-efficiency, and security of your infrastructure, then Terraform is a great option.

Here are some of the reasons why we need Terraform:

Infrastructure is becoming more complex: As the world becomes more digital, the infrastructure that supports it is becoming more complex. This makes it difficult to manage infrastructure manually.

Infrastructure is becoming more dynamic: Infrastructure is also becoming more dynamic, as changes are made more frequently. This makes it difficult to keep track of changes and ensure that infrastructure is always up-to-date.

The need for automation: The need for automation is growing as the complexity and dynamism of infrastructure increases. Terraform provides a way to automate the provisioning and management of infrastructure, which can help to improve efficiency and reduce errors.

I hope this helps! Let me know if you have any other questions.



# How Infra has to be built and what's the order ?
```
    1) VPC 
    2) ALB 
    3) DB's 
    4) Backend Components [ catalogue | cart | user | shipping | payment | frontend ] : Parallel 
```

# How Infra has to be destroted and what's the order ?

```
    1) Backend Components [ catalogue | cart | user | shipping | payment | frontend ] : Parallel 
    2) DB's 
    3) ALB 
    4) VPC 
```