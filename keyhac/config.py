import time
from keyhac import *


class Vi(object):

    def __init__(self, keymap):
        self.keymap = keymap
        self.emacs = keymap.defineWindowKeymap()
        self.emacs.is_marked = False

    def delete_char(self):
        self.keymap.InputKeyCommand('Delete')()

    def kill_word(self, repeat=1):
        self.emacs.is_marked = True

        def move_end_of_region():
            for i in range(repeat):
                self.forward_word()

        self.mark(move_end_of_region)()
        self.delay(self.kill_region)()

    def kill_region(self):
        self.keymap.InputKeyCommand("C-x")()

    def mark(self, func):

        def _func():
            if self.emacs.is_marked:
                # D-Shift だと、M-< や M-> 押下時に、D-Shift が解除されてしまう。その対策。
                self.keymap.InputKeyCommand("D-LShift", "D-RShift")()
                self.delay(func)()
                self.keymap.InputKeyCommand("U-LShift", "U-RShift")()
            else:
                func()

        return _func

    def delay(self, func, sec=0.01):

        def _func():
            time.sleep(sec)  # delay
            func()
            time.sleep(sec)  # delay

        return _func

    def forward_word(self):
        self.keymap.InputKeyCommand("C-Right")()


def configure(keymap):
    keymap_global = keymap.defineWindowKeymap()
    vi = Vi(keymap)

    ################################################################################
    # Space and Shift
    ################################################################################
    keymap.replaceKey('Space', 'RShift')
    keymap_global['O-RShift'] = 'Space'

    ################################################################################
    # vim like
    ################################################################################
    keymap.defineModifier('Semicolon', 'User0')
    for any in ("", "S-", "C-", "C-S-", "A-", "A-S-", "A-C-", "A-C-S-", "W-", "W-S-", "W-C-",
                "W-C-S-", "W-A-", "W-A-S-", "W-A-C-", "W-A-C-S-"):
        keymap_global[any + 'O-Space'] = any + 'Space'
        keymap_global[any + 'O-Semicolon'] = any + 'Semicolon'
        keymap_global[any + 'O-S-Semicolon'] = any + 'Colon'
        keymap_global[any + 'U0-h'] = any + 'Left'
        keymap_global[any + 'U0-j'] = any + 'Down'
        keymap_global[any + 'U0-k'] = any + 'Up'
        keymap_global[any + 'U0-l'] = any + 'Right'
        keymap_global[any + 'W-h'] = any + 'Left'
        keymap_global[any + 'W-j'] = any + 'Down'
        keymap_global[any + 'W-k'] = any + 'Up'
        keymap_global[any + 'W-l'] = any + 'Right'
        keymap_global[any + 'U0-q'] = any + 'Escape'
        keymap_global[any + 'U0-b'] = any + 'Back'
        keymap_global[any + 'U0-n'] = any + 'Return'
        keymap_global[any + 'U0-m'] = any + 'Return'

    keymap_global['U0-S-a'] = 'End'
    keymap_global['U0-S-i'] = 'Home'
    keymap_global['U0-o'] = 'End', 'S-Return'
    #keymap_global['U0-x'] = 'Delete'
    keymap_global['U0-x'] = vi.delete_char
    keymap_global['U0-e'] = vi.kill_word
    keymap_global['U0-S-x'] = 'Left', 'Delete'
    keymap_global['U0-S-o'] = 'Home', 'S-Return', 'Up'
    keymap_global['U0-S-d'] = 'S-End', 'Delete'
    keymap_global['U0-d'] = keymap.defineMultiStrokeKeymap('')
    keymap_global['U0-d']['U0-d'] = 'Home', 'S-End', 'C-x'

    def launch_ubuntu():
        shellExecute(None, "ubuntu.exe", "", "")

    keymap_global['U0-t'] = launch_ubuntu

    ################################################################################
    # toggle IME
    ################################################################################
    def switch_ime(flag):
        BALLOON_TIMEOUT_MSEC = 500

        if flag:
            ime_status = 1
            message = u'[あ]'
        else:
            ime_status = 0
            message = u'[_A]'
        wnd = keymap.getTopLevelWindow()

        # keymap.wnd.getImeStatus()
        def wrap():
            keymap.wnd.setImeStatus(ime_status)
            keymap.popBalloon('ime_status', message, BALLOON_TIMEOUT_MSEC)

        return wrap

    keymap_global['D-LAlt'] = 'D-LAlt', 'LCtrl'
    keymap_global['D-RAlt'] = 'D-RAlt', 'LCtrl'
    keymap_global['O-LAlt'] = switch_ime(False)
    keymap_global['O-RAlt'] = switch_ime(True)

    greek_upper = {
        'alpha': 'Α',
        'beta': 'Β',
        'gamma': 'Γ',
        'delta': 'Δ',
        'epsilon': 'Ε',
        'zeta': 'Ζ',
        'eta': 'Η',
        'theta': 'Θ',
        'iota': 'Ι',
        'kappa': 'Κ',
        'lambda': 'Λ',
        'mu': 'Μ',
        'nu': 'Ν',
        'xi': 'Ξ',
        'omicron': 'Ο',
        'pi': 'Π',
        'rho': 'Ρ',
        'sigma': 'Σ',
        'tau': 'Τ',
        'upsilon': 'Υ',
        'phi': 'Φ',
        'chi': 'Χ',
        'psi': 'Ψ',
        'omega': 'Ω',
    }
    greek_lower = {
        'alpha': 'α',
        'beta': 'β',
        'gamma': 'γ',
        'delta': 'δ',
        'epsilon': 'ε',
        'zeta': 'ζ',
        'eta': 'η',
        'theta': 'θ',
        'iota': 'ι',
        'kappa': 'κ',
        'lambda': 'λ',
        'mu': 'μ',
        'nu': 'ν',
        'xi': 'ξ',
        'omicron': 'ο',
        'pi': 'π',
        'rho': 'ρ',
        'sigma': 'σ',
        'tau': 'τ',
        'upsilon': 'υ',
        'phi': 'φ',
        'chi': 'χ',
        'psi': 'ψ',
        'omega': 'ω',
    }

    entry_greek_upper = keymap_global['S-U0-LShift'] = keymap.defineMultiStrokeKeymap()
    entry_greek_lower = keymap_global['U0-LShift'] = keymap.defineMultiStrokeKeymap()

    def input_greek_alphabet(name, case):
        d = {'upper': entry_greek_upper, 'lower': entry_greek_lower}[case]
        s = ''
        for c in name[:-1]:
            s += c
            keymap.popBalloon('ime_status', s, 500)
            d[c] = keymap.defineMultiStrokeKeymap()
            d = d[c]
        d[name[-1]] = keymap.InputTextCommand({
            'upper': greek_upper[name],
            'lower': greek_lower[name]
        }[case])

    for name in greek_upper.keys():
        input_greek_alphabet(name, 'upper')
        input_greek_alphabet(name, 'lower')