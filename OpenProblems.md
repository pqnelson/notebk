# Introduction #

These are just my collection of open research problems that are interesting to me.


# Lie Groups #

  1. How do we define an infinite-dimensional Lie group?
    1. What is the relationship of an infinite-dimensional Lie algebra to an infinite-dimensional Lie group?

# Sphere Packings and Stuff #

From [workshop](http://www.aimath.org/WWN/spherepacking/) on the matter, there is a list of open problems, which we reproduce.

  1. The new analytic upper bounds can be obtained in all dimensions, not just 2, 8, 24. How do they behave asymptotically? In particular, how do they compare with the best asymptotic bounds known, due to Kabatiansky and Levenshtein? If worse, how far must one go before Kabatiansky-Levenshtein is better? (It is known already that K-L is worse at least through dimension 36.)
  1. The sphere-packing bounds are analogous to 'linear programming' bounds on codes in compact two-point homogeneous spaces, such as Hamming spaces or Euclidean spheres. In those settings, several codes can be proved optimal with such methods (e.g., the configurations of shortest nonzero vectors in E<sub>8</sub> and Leech), but many other codes that seem to be optimally efficient still defy an analogous proof (e.g., the 24 minimal vectors of the D<sub>4</sub> lattice; NB while Musin did recently prove that 24 is the kissing number in dimension 4, he didn't show the D<sub>4</sub> configuration is unique, nor even (I think) that it attains the maximal distance for a 24-point code in S<sub>3</sub>). Are there refinements or extensions of that 'linear programming' method that can extend its range to problems such proving the uniqueness of the 4-dimensional kissing configuration, or the optimality of the D<sub>4</sub> sphere packing -- or go asymptotically beyond the K-L bound, which has not been improved in high dimensions during the 25+ years since its publication?
  1. The Leech lattice has been known for some time to be optimal and unique among unimodular even lattices in its dimension. Theta functions and weighted theta functions of lattices constitute a key ingredient in several proofs of this result, and give important combinatorial information about the E<sub>8</sub> and Leech lattices and about many other lattices of interest. Similar methods apply to some error-correcting codes. Can they be made to work for 'vertex operator algebras' (VOAs)? The Monster VOA is said to be a higher-level analogue of the Leech lattice, as the Leech lattice is itself a higher-level analogue of the extended binary Golay code; and VOA's have generating functions that are modular functions, as the theta function of an integral lattice is automatically a modular form. Are there also analogues of weighted theta functions that might be used to prove the uniqueness of the Monster in some natural class of VOA's?
  1. Instead of lattices over **Z**, consider lattices over **Z**`[i]`, **Z**`[`e<sup>i2π/3</sup>`]`, the Hurwitz quaternions, etc. Can one find linear programming bounds for such lattices that exploit the additional structure? This structure can provide additional handles for trying to classify lattices L of a given rank that have the same structure. For example one could use L/(i + 1)L instead of L/2L. Using the Leech lattice as an example, each of the 2<sup>12</sup> - 1 nontrivial classes in L/(i + 1)L is represented by an orthogonal frame of 2·24 minimal Leech vectors. Can one use similar techniques to classify VOA's with the same structure?
  1. Thompson's sporadic simple group `Th` acts on an even unimodular lattice `Γ` in 248 dimensions. What relationship is there between the compact Lie group E<sub>8</sub> and `Th`? More precisely, mod-3 reduction of the lattice above embeds `Th` in E<sub>8</sub> over F<sub>3</sub>, but `Th` is not a subgroup of E<sub>8</sub> itself. However, it has two very large subgroups that do live in E<sub>8</sub>. What explains these patterns? Perhaps these subgroups can be used to describe the lattice. Is there a form of E<sub>8</sub> over the integers which is compact over the reals, and for which the group of integral points acts irreducibly in the adjoint representation on the Lie algebra?

These problems are about dimensions 8 and 24 mainly, but one could ask them in other dimensions also. We think that in general they will not have positive answers, except in certain dimensions, such as 1 and 2, for some of these questions. A positive answer to Question 1 implies the complete solution to the sphere packing problem in dimensions 8 and 24.

  1. Can the technique of Cohn-Elkies prove that the E<sub>8</sub> and Leech lattices have the highest sphere packing densities in dimensions 8 and 24, respectively?
  1. Settle the Cohn-Elkies conjecture: that there exist 'optimal functions' for use in their theorem in these dimensions. (If yes, the answer to Question 1 is 'yes'.)
  1. Further conjectures of Cohn-Miller:
    1. Can their determinants be rescaled according to their conjecture 3.2?
    1. Do their rescaled determinants converge uniformly on compact sets to a limiting function?
    1. Does this limiting function have any unexpected sign changes (i.e. sign changes other than the forced ones). If 'yes', 'yes', and 'no', respectively, then the answer to Question 2 is 'yes'.
  1. What are the purported limits of the Cohn-Miller sequences? Can the observed rationalities in their Taylor coefficients be explained? Are there others outside from the quadratic terms?

The Epstein-zeta function of a lattice is a Mellin transform of the theta function of the lattice. These functions depend only on the length spectrum of the vectors in the lattice. Let E(L, s) be the Epstein Zeta function for a lattice L of covolume 1 in **R**<sup>n</sup>. Here `s` is positive and `E(L, s) = \sum_{m\in L-\{0\}} |m|^{-2s}`. This converges for `s > n/2` and makes sense by analytic continuation for all `s` (this is due to Epstein).

**Question 0:** For a fixed `s`, which `L` yields the minimum value of `E(L, s)`?

For `s` → ∞ this becomes the familiar densest lattice packing problem. For `n = 2` Rankin and Cassels showed that the hexagonal lattice is the unique minimizer for all `s > 0`. What we can show is that `D,,4,,` (when `n = 4`), `L = E,,8,,` (when `n = 8`) and the Leech lattice (when `n = 24`) are local optima for `E(L, s)`, for every `s > 0`.

**Conjecture 1:** These lattices in dimensions 4, 8 and 24 are global minimizers of `E(L, s)`, for any fixed `s > 0`. (The corresponding statement is false in dimension `n = 3`; the fcc lattice is not the global minimizer of `E(L, s)` for any `0 < s < 3/4`.)

**Problem 2:** Does there exist in each dimension a lattice `L` for which `E(L, s)` has no zeroes in (0, ∞)?
(Note: One can show that if a lattice `L` is a local minimizer of `E(L, s)` for all positive `s`, then at least `E(L , s)` has no odd order zero in `s` on (0, ∞).)

Can the completely-extendable conformal intertwining algebras introduced by Y.-Z. Huang be used to prove the conjecture of Frenkel, Lepowsky and Meurman that the Moonshine module vertex operator algebra has a uniqueness property analogous to the uniqueness of the Golay code and of the Leech lattice? (For instance, one already has analogs of 'duality' and 'self-duality' (as in lattices) for vertex operator algebras).


What is the analog of 'genus' for vertex operator algebras? What is the analog of Kneser's 'neighbour theorem' in lattices for vertex operator algebras? What is the analogous notion to Voronoi cells and Voronoi vectors for vertex operator algebras?

**Conjecture:** Any 'good' vertex operator algebra V has finite automorphism group if and only if V<sub>1</sub> = 0. Here 'good' means 'has semi-simple representation theory'.

Let `Γ` be the Thompson-Smith lattice, an even unimodular lattice. The construction of `Γ` is ‘local’ in nature, and there is little global information known. For example, the rank and determinant of `Γ` are known for every value of p. However, the minimal vectors of `Γ` are not known and the theta function is not known. It was recently shown by G. Nebe that `Γ` contains a norm 12 vector. Is there a norm 14 vector in `Γ`? Are the norm 12 and norm 16 orbits unique? Does the vertex operator algebra for `Γ` have any interesting structure?

## And the Monster... ##

Let **M** be the Monster simple group. Then **M** has a subgroup 2 · M<sub>24</sub> × S<sub>2</sub> where M<sub>24</sub> is the automorphism group of the Golay code. The group Co<sub>0</sub> has a subgroup 2<sup>12</sup> · M<sub>24</sub> where 2<sup>12</sup> = C, the Golay code, and Fi<sub>24</sub> also has a subgroup 2<sup>12</sup> · M<sub>24</sub> where 2<sup>12</sup> = C<sup>∗</sup> , the Golay cocode:

M<sub>24</sub> --- (2<sup>12</sup> · M<sub>24</sub> ⊆ Fi<sub>24</sub>) --- (2 · M<sub>24</sub> × S<sub>2</sub> ⊆ **M**) --- (2<sup>12</sup> · M<sub>24</sub> ⊆ Co<sub>0</sub>) --- M<sub>24</sub>

These are automorphisms of

Code --- Lattice --- VOA --- X --- Code

What is X?