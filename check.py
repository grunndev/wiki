import sys

try:
    import markdown
except ImportError:
    print('Python-Markdown is not installed. Please insert installation CD.')
    sys.exit(1)
else:
    print('Python-Markdown is installed.')
