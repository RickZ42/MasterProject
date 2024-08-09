import pandas as pd

# Read the input file
file_path = '/g/data/xf3/zz3507/database/GeneFamilyExpentionContractionDataset/OrthoFinder/Results_Jul18/Orthogroups/Orthogroups.GeneCount.tsv'
df = pd.read_csv(file_path, sep='\t')

# Check if the required column exists
required_columns = ['Orthogroup', 'Amborella_trichopoda', 'Ananas_comosus', 'Apostasia_shenzhenica', 'Arabidopsis_thaliana', 
                    'Asparagus_officinalis', 'Brachypodium_distachyon', 'Chiloglottis_trapeziformis', 'Cymbidium_ensifolium', 
                    'Dendrobium_catenatum', 'Gastrodia_elata_noNCBI', 'Musa_acuminata', 'Oryza_sativa', 'Phoenix_roebelenii', 
                    'Populu_trichocarpa', 'Sorghum_bicolor', 'Spirodela_polyrhiza', 'Vitis_vinifera']

missing_columns = [col for col in required_columns if col not in df.columns]
if missing_columns:
    print(f"Missing columns: {missing_columns}")
else:
    print("All required columns are present.")

# Remove the 'Total' column if it exists
if 'Total' in df.columns:
    df = df.drop(columns=['Total'])

# Save the cleaned file
output_file_path = '/g/data/xf3/zz3507/database/GeneFamilyExpentionContractionDataset/OrthoFinder/Results_Jul18/Orthogroups/Cleaned_Orthogroups.GeneCount.tsv'
df.to_csv(output_file_path, sep='\t', index=False)
print(f"Cleaned file saved to: {output_file_path}")