import sys
import misaka as m


extensions = ('no-intra-emphasis', 'fenced-code', 'tables')


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Missing input file!', file=sys.stderr)
        sys.exit(1)

    try:
        with open(sys.argv[1], 'r') as fd:
            print(m.html(fd.read(), extensions))
        sys.exit(0)
    except FileNotFoundError:
        print('Could not find file!', file=sys.stderr)
    except PermissionError:
        print('No permission to read file!', file=sys.stderr)
    sys.exit(1)
