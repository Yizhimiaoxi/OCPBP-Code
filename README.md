# _Quantum image encryption algorithm via optimized quantum circuit and parity bit-plane permutation (OCPBP)_
_The structure of the proposed OCPBP is consists of twice permutation operations and once diffusion operation.
The OCPBP algorithm comprises a total of four steps. 
Since this algorithm is quantum-based and current technology does not support quantum image quantization, we conducted simulation experiments exclusively using MATLAB._

_We employed digital image encryption techniques to simulate the encryption process of the algorithm.
The code has been implemented to encrypt grayscale images, generating key image, encrypted images, and decrypted images. 
Furthermore, we have included comments in the code to aid readers in understanding.
For RGB color images, the encryption and decryption processes can be achieved by separately encrypting the R, G, and B layers and subsequently recombining them._

# _Abstract_

_Quantum image encryption technology employs the unique features of superposition, entanglement, and
quantum state instability, offering advantages like high efficiency, parallelism, and robust resistance to
decryption attempts. In this work, we propose a quantum image encryption algorithm via an optimized
quantum circuit and parity bit-plane permutation named OCPBP. Our research commences with applying
an optimization algorithm to BRQI image preparation. This optimization significantly reduces the number
of auxiliary qubits from n+3 to 2 in the preparation of (n+5)-CNOT gate preparation. This reduction makes a
significant simplification of the complexity and memory space required for BRQI image preparation. Moreover,
we introduce an innovative operation based on parity pixel bit-planes for permutation, which provides a fresh
perspective on quantum image encryption based on the BRQI model. Furthermore, we generate quantum key
images for XOR operations using the improved logistic map, effectively tackling the challenge of non-random
keys that can be a concern in conventional BRQI encryption techniques. We also perform a row-columnbased
 permutation operation to enhance the algorithm’s resilience against potential attacks. Through extensive
theoretical analysis and comparative experiments, we confirm the heightened security and reduced complexity
of the proposed OCPBP algorithm compared to BRQI-based and chaotic image encryption methods. It holds
significant promise for improving quantum image communication and application._

# _Papper Information_

_Title: Quantum image encryption algorithm via optimized quantum circuit and parity bit-plane permutation
Author：Jinwen He, Hegui Zhu*, Xv Zhou
Publishing journals：Journal ofInformation Security and Applications
2024-03 |Journal article
DOI: 10.1016/j.jisa.2024.103698
Paper search link：linkinghub.elsevier.com/retrieve/pii/S2214212624000012_
