import sys
import hoep as h


extensions = h.EXT_NO_INTRA_EMPHASIS
render_flags = h.HTML_SMARTYPANTS


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Missing input file!', file=sys.stderr)
        sys.exit(1)

    try:
        with open(sys.argv[1], 'r') as fd:
            print(h.render(fd.read(), extensions, render_flags))
        sys.exit(0)
    except FileNotFoundError:
        print('Could not find file!', file=sys.stderr)
    except PermissionError:
        print('No permission to read file!', file=sys.stderr)
    sys.exit(1)
