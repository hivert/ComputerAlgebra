from sage.rings.rational_field import Q as QQ
from sage.rings.infinity import Infinity


class PolyCommon:
    baseRing = QQ
    baseZero = QQ(0)
    baseUn   = QQ(1)

    def _string_monomial(self, i, co, premier):
        res = ""
        if co != self.baseZero:
            if co > self.baseZero and not premier:
                res += " + ";
            if co < self.baseZero:
                res += " - ";
                co = -co
            if co != self.baseUn or i == 0:
                res += str(co)
            if i > 1:
                res += "X^%i"%i
            elif i == 1:
                res += "X"
        return res


    def __repr__(self):
        if not self:
            return "0"
        else:
            mon = self.monomials()
            d, co = mon.pop()
            res = self._string_monomial(d, co, True)
            mon.reverse()
            for d, co in mon:
                res += self._string_monomial(d, co, False);
        return res

    def __pow__(self, i):
        r"""
        Generic powering from multiplication
        """
        raise NotImplementedError


class PolyDense(PolyCommon):
    r"""
    A class representing dense univariate polynomials

    EXAMPLE::

        sage: X = PolyDense.X()
        sage: X^2 + 3
        X^2 + 3
        sage: X^5*(5/2) + X^2 + 3
        5/2X^5 + X^2 + 3
    """
    def __init__(self, coeffs=None):
        r"""
        EXAMPLES::
            sage: PolyDense()
            0
            sage: PolyDense([1])
            1
            sage: PolyDense([0, 1])
            X
            sage: PolyDense([0, 1, 0, 2/3])
            2/3X^3 + X
        """
        raise NotImplementedError

    @classmethod
    def X(cls):
        r"""
        The unknown of polynomials

        EXAMPLES::

            sage: PolyDense.X()
            X
        """
        return cls([0, 1])

    def monomials(self):
        r"""
        The sorted monomials of `self`

        EXAMPLES::
            sage: PolyDense().monomials()
            []
            sage: PolyDense([1]).monomials()
            [(0, 1)]
            sage: PolyDense([0, 1]).monomials()
            [(1, 1)]
            sage: PolyDense([0, 1, 0, 2/3]).monomials()
            [(1, 1), (3, 2/3)]
        """
        raise NotImplementedError

    def degree(self):
        r"""
        The degree of self

        - `-Infinity` if the polynomial is zero

        EXAMPLES::

            sage: PolyDense().degre()
            -Infinity
            sage: PolyDense([0]).degre()
            -Infinity
            sage: PolyDense([1]).degre()
            0
            sage: PolyDense([0, 1]).degre()
            1
            sage: PolyDense([0, 1, 0]).degre()
            1
            sage: PolyDense([0, 1, 0, 2/3, 0]).degre()
            3
        """
        raise NotImplementedError

    def coeff(self, i):
        r"""
        The coefficient of `X^i` of `self`

        EXAMPLES::

            sage: PolyDense().coeff(0)
            0
            sage: P = PolyDense([0, 1, 0, 2/3, 0])
            sage: [P.coeff(i) for i in range(10)]
            [0, 1, 0, 2/3, 0, 0, 0, 0, 0, 0]
        """
        raise NotImplementedError

    def __bool__(self):
        r"""
        Whether `self` is the zero polynomial

        EXAMPLES::

            sage: bool(PolyDense())
            False
            sage: bool(PolyDense([0]))
            False
            sage: bool(PolyDense([0, 1]))
            True
        """
        raise NotImplementedError

    def set_coeff(self, d, co):
        r"""
        Modify a coefficient of `self`

        EXAMPLES::

            sage: P = PolyDense(); P.set_coeff(2, 3/2); P
            3/2X^2
            sage: P = PolyDense([0, 1, 0, 2/3])
            sage: P.set_coeff(2, -5/3); P
            2/3X^3 - 5/3X^2 + X
            sage: P.set_coeff(8, -1/8); P
            - 1/8X^8 + 2/3X^3 - 5/3X^2 + X
        """
        raise NotImplementedError

    def __add__(self, other):
        r"""
        The sum of two polynomials

        EXAMPLES::

            sage: PolyDense([0, 1]) + 2
            X + 2
            sage: PolyDense([0, 1, 3]) + PolyDense([0, 1, 0, 3/2])
            3/2X^3 + 3X^2 + 2X
            sage: PolyDense([0, 1, 3]) + PolyDense([0, -1, -3])
            0
        """
        raise NotImplementedError

    def __eq__(self, other):
        r"""
        Comparison of polynomials

        EXAMPLES::

            sage: PolyDense() == PolyDense()
            True
            sage: PolyDense([0, 1]) == PolyDense([0, 1])
            True
            sage: PolyDense([0, 1]) == PolyDense()
            False
            sage: PolyDense([0, 1]) + 2 == PolyDense([2, 1])
            True
        """
        raise NotImplementedError("code non implanté ligne 207");

    def __ne__(self, other):
        r"""
        Comparison of polynomials

        EXAMPLES::

            sage: PolyDense() != PolyDense()
            False
            sage: PolyDense([0, 1]) != PolyDense([0, 1])
            False
            sage: PolyDense([0, 1]) != PolyDense()
            True
            sage: PolyDense([0, 1]) + 2 != PolyDense([2, 1])
            False
        """
        return not (self == other)

    def __mul__(self, other):
        r"""
        Product of polynomials

        EXAMPLES::

            sage: PolyDense([0, 1, 2])*2
            4X^2 + 2X
            sage: PolyDense()*PolyDense([0, 1, 2])
            0
            sage: PolyDense([1])*PolyDense([0, 1, 2])
            2X^2 + X
            sage: PolyDense([1, -2])*PolyDense([0, 1, 2])
            - 4X^3 + X
        """
        raise NotImplementedError

    def __call__(self, a):
        r"""
        Hörner's method for evaluating a polynomial

        EXAMPLES::

            sage: PolyDense([1, 1])(3/2)
            5/2
            sage: PolyDense([1, -2, 3])(2)
            9
        """
        raise NotImplementedError

class PolySparseHash(PolyCommon):
    """
    Sparse polynomial using Hash table
    """
    def __init__(self, coeffs=None):
        r"""
        """
        raise NotImplementedError

class PolySparseList(PolyCommon):
    """
    Sparse polynomial using sorted list of coefficients
    """
    def __init__(self, coeffs=None):
        r"""
        """
        raise NotImplementedError

