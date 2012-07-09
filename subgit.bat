@echo off
cd .emacs.d

echo "==============================git magit=============================="
if exist magit\magit.el (
echo "magit�Ѿ�����"
) else (
echo "magit������"
rm -r -f magit
git clone git://github.com/magit/magit.git
) 

echo "==============================git ecb=============================="
if exist ecb\ecb.el (
echo "ecb�Ѿ�����"
) else (
echo "ecb������"
rm -r -f ecb
git clone git://github.com/alexott/ecb.git
) 

cd el-get
echo "==============================git undo-tree=============================="
if exist undo-tree\undo-tree.el (
echo "undo-tree�Ѿ�����"
) else (
echo "undo-tree������"
rm -r -f undo-tree
git clone http://www.dr-qubit.org/git/undo-tree.git
) 

echo "==============================git yasnippet=============================="
if exist yasnippet\yasnippet.el (
echo "yasnippet�Ѿ�����"
) else (
echo "yasnippet������"
rm -r -f yasnippet
git clone git://github.com/capitaomorte/yasnippet.git
) 

echo "==============================git fuzzy=============================="
if exist fuzzy\fuzzy.el (
echo "fuzzy�Ѿ�����"
) else (
echo "fuzzy������"
rm -r -f fuzzy
git clone git://github.com/m2ym/fuzzy-el.git fuzzy
) 

echo "==============================git popup=============================="
if exist popup\popup.el (
echo "popup�Ѿ�����"
) else (
echo "popup������"
rm -r -f popup
git clone git://github.com/m2ym/popup-el.git popup
) 

echo "==============================git auto-complete=============================="
if exist auto-complete\auto-complete.el (
echo "auto-complete�Ѿ�����"
) else (
echo "auto-complete������"
rm -r -f auto-complete
git clone git://github.com/m2ym/auto-complete.git
) 


echo "git all successfully!"
pause
