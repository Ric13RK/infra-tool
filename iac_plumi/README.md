## Running the Pulumi IaC

1. Create a new stack:

    ```bash
    $ pulumi stack init iac-pulumi
    ```

1. Configure the Gcloud cli:

    ```bash
    $ gcloud config configuration activate rishi_personal
    $ gcloud config list # (make sure the project id: plumi-iac-test; region=australia-southeast1; zone=australia-southeast1-a)
    $ gcloud auth login
    ```

1. Run `pulumi up` to preview and deploy changes:

    ```bash
    $ pulumi up
    Previewing update:
    ...

    Do you want to perform this update? yes
    Updating:
    ...
    
    Outputs:
    ...

    Resources:
        ...

    Duration: ...
    ```

1. Destroy the created resources:

    ```bash
    $ pulumi destroy
    Previewing destroy:
    ...
    
    Outputs:
    ...

    Resources:
        - .. to delete

    Do you want to perform this destroy? yes
    Destroying:
    ...
    
    Outputs:
    ...

    Resources:
        - .. deleted

    Duration: ..
    ```

1. Destroy the stack:

    ```bash
    $ pulumi stack rm
    This will permanently remove the 'iac-pulumi' stack!
    Please confirm that this is what you'd like to do by typing ("iac-pulumi"): iac-pulumi
    Stack 'iac-pulumi' has been removed!
    ```