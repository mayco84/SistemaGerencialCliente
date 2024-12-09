object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 461
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  WindowState = wsMaximized
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 85
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 17
      Top = 16
      Width = 116
      Height = 87
      Alignment = taCenter
      Caption = 'Sistema Gerencial de Cadastro '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Sitka Text'
      Font.Style = []
      GlowSize = 9
      ParentFont = False
      WordWrap = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 85
    Width = 160
    Height = 376
    Align = alLeft
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object btnCadastro: TSpeedButton
      AlignWithMargins = True
      Left = 10
      Top = 20
      Width = 140
      Height = 22
      Margins.Left = 10
      Margins.Top = 20
      Margins.Right = 10
      Align = alTop
      Caption = '&Cadastros'
      Flat = True
      Transparent = False
      StyleElements = [seFont, seClient]
      OnClick = btnCadastroClick
      ExplicitLeft = 32
      ExplicitTop = 88
      ExplicitWidth = 23
    end
  end
  object popCadastros: TPopupMenu
    Left = 128
    Top = 88
    object Clientes1: TMenuItem
      Caption = '&Clientes'
      OnClick = Clientes1Click
    end
  end
end
