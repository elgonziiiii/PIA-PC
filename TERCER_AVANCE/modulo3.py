import os
import logging

# Configurar logging
logging.basicConfig(filename='malware_scanner.log', level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

# Definir las firmas de malware (patrones sospechosos)
MALWARE_PATTERNS = [
    'malicious_pattern1',
    'malicious_pattern2',
    'suspicious_function_call'
]

def is_valid_directory(path):
    """Validate if the provided path is a valid directory."""
    if not os.path.isdir(path):
        logging.error(f"Invalid directory: {path}")
        raise ValueError(f"Invalid directory: {path}")
    return True

def scan_file(file_path):
    """Scan a single file for malware patterns."""
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
            for pattern in MALWARE_PATTERNS:
                if pattern in content:
                    logging.warning(f"Malware detected in {file_path} - Pattern: {pattern}")
                    return True
    except UnicodeDecodeError:
      logging.warning(f"Cannot read {file_path} due to encoding issues.")
    except Exception as e:
        logging.error(f"Error scanning file {file_path}: {e}")
        raise
    return False

def scan_directory(directory_path):
    """Scan all files in the directory for malware."""
    results = []
    try:
        is_valid_directory(directory_path)
        for root, _, files in os.walk(directory_path):
            for file in files:
                file_path = os.path.join(root, file)
                logging.info(f"Scanning file: {file_path}")
                if scan_file(file_path):
                    results.append(f"Potential malware found in {file_path}. Check logs for details.")
        return results
    except Exception as e:
        logging.error(f"Error scanning directory {directory_path}: {e}")
        raise
