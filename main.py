import kagglehub


def main():

    path = kagglehub.dataset_download("awsaf49/brats20-dataset-training-validation")
    print("Path to dataset files:", path)

if __name__ == "__main__":
    main()
